import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anket Uygulaması - DartPad',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: HomePage(),
    );
  }
}

// ------------------ Soru Modeli ------------------
class Question {
  final String text;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  Question({
    required this.text,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });
}

// ------------------ Anket Data ------------------
final Map<String, List<Question>> surveys = {
  'Genel Kültür Anketi': [
    Question(
      text: 'Türkiye’nin başkenti neresidir?',
      options: ['İstanbul', 'Ankara', 'İzmir'],
      correctIndex: 1,
      explanation: 'Türkiye’nin başkenti Ankara’dır.',
    ),
    Question(
      text: 'Güneş sistemindeki en büyük gezegen hangisidir?',
      options: ['Jüpiter', 'Satürn'],
      correctIndex: 0,
      explanation: 'Jüpiter en büyük gezegendir.',
    ),
  ],
  'Teknoloji Anketi': [
    Question(
      text: 'Flutter hangi dili kullanır?',
      options: ['Dart', 'Java', 'Kotlin'],
      correctIndex: 0,
      explanation: 'Flutter uygulamaları Dart ile yazılır.',
    ),
  ],
  'Sağlık Anketi': [
    Question(
      text: 'Günde kaç saat uyku önerilir?',
      options: ['4-5', '7-9'],
      correctIndex: 1,
      explanation: 'Yetişkinler için 7-9 saat uyku önerilir.',
    ),
  ],
};

// ------------------ Form Depolama ------------------
class SurveyStorage {
  static final List<Map<String, String>> savedForms = [];

  static void saveForm(String surveyTitle, String name, String email) {
    savedForms.add({
      'anket': surveyTitle,
      'isim': name,
      'email': email,
      'tarih': DateTime.now().toString(),
    });
  }
}

// ------------------ Ana Sayfa ------------------
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Uygulamaya Hoş geldiniz')),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Anketlere hoş geldiniz!', style: TextStyle(fontSize: 22)),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => SurveySelectionPage()),
                      );
                    },
                    child: Text('Ankete Başla'),
                  ),
                ],
              ),
            ),
          ),

          Container(
            height: 60,
            color: Colors.grey[300],
            child: Center(child: Text('REKLAM ALANI (Ana Sayfa Altı)')),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.report_problem), label: 'Şikayet'),
          BottomNavigationBarItem(icon: Icon(Icons.contact_mail), label: 'İletişim'),
        ],
        onTap: (i) {
          if (i == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (_) => ComplaintPage()));
          } else if (i == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (_) => ContactPage()));
          }
        },
      ),
    );
  }
}

// ------------------ Anket Seçim Sayfası ------------------
class SurveySelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Anket Seçimi')),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          Text('Mevcut Anketler', style: TextStyle(fontSize: 18)),
          SizedBox(height: 8),
          ...surveys.keys.map((title) => Card(
                child: ListTile(
                  title: Text(title),
                  subtitle: Text('${surveys[title]!.length} soru'),
                  trailing: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => QuizPage(surveyTitle: title),
                        ),
                      );
                    },
                    child: Text('Başla'),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

// ------------------ Quiz (Soru Sayfası) ------------------
class QuizPage extends StatefulWidget {
  final String surveyTitle;
  QuizPage({required this.surveyTitle});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late List<Question> questions;
  int currentIndex = 0;
  int? selectedOption;
  late List<int?> answers;

  @override
  void initState() {
    super.initState();
    questions = surveys[widget.surveyTitle]!;
    answers = List<int?>.filled(questions.length, null);
  }

  void _showFeedback(bool correct, String explanation) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        backgroundColor: correct ? Colors.green[300] : Colors.red[300],
        title: Text(correct ? 'Doğru!' : 'Yanlış!',
            style: TextStyle(color: Colors.white)),
        content: Text(explanation, style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Kapat', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }

  void _nextQuestion() {
    if (selectedOption == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Lütfen seçenek seçin.')));
      return;
    }

    answers[currentIndex] = selectedOption;

    bool correct = selectedOption == questions[currentIndex].correctIndex;
    _showFeedback(correct, questions[currentIndex].explanation);

    Future.delayed(Duration(milliseconds: 500)).then((_) {
      if (!mounted) return;

      setState(() {
        if (currentIndex < questions.length - 1) {
          currentIndex++;
          selectedOption = answers[currentIndex];
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => SurveyCompletePage(surveyTitle: widget.surveyTitle),
            ),
          );
        }
      });
    });
  }

  void _prevQuestion() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
        selectedOption = answers[currentIndex];
      });
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = questions[currentIndex];
    final showAd = currentIndex >= 1; // 2. sorudan sonra

    return Scaffold(
      appBar: AppBar(
          title: Text('${widget.surveyTitle} - Soru ${currentIndex + 1}/${questions.length}')),
      body: Column(
        children: [
          if (showAd)
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.yellow[200],
              child: Center(child: Text('REKLAM ALANI')),
            ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(q.text,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 12),
                  ...List.generate(q.options.length, (i) {
                    return Card(
                      child: RadioListTile<int>(
                        value: i,
                        groupValue: selectedOption,
                        title: Text(q.options[i]),
                        onChanged: (v) {
                          setState(() => selectedOption = v);
                        },
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(onPressed: _prevQuestion, child: Text('Geri')),
                ElevatedButton(
                    onPressed: _nextQuestion,
                    child: Text(currentIndex < questions.length - 1
                        ? 'Sonraki'
                        : 'Bitir')),
                ElevatedButton(
                  onPressed: () =>
                      Navigator.of(context).popUntil((r) => r.isFirst),
                  child: Text('Ana Sayfa'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------ Anket Tamamlandı + Form Sayfası ------------------
class SurveyCompletePage extends StatefulWidget {
  final String surveyTitle;
  SurveyCompletePage({required this.surveyTitle});

  @override
  _SurveyCompletePageState createState() => _SurveyCompletePageState();
}

class _SurveyCompletePageState extends State<SurveyCompletePage> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Anket Tamamlandı')),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Text('Tebrikler! Lütfen formu doldurun.'),
            SizedBox(height: 12),

            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'İsim'),
                    validator: (v) => v!.isEmpty ? 'İsim gerekli' : null,
                    onSaved: (v) => name = v!,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (v) => v!.isEmpty ? 'Email gerekli' : null,
                    onSaved: (v) => email = v!,
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        SurveyStorage.saveForm(widget.surveyTitle, name, email);

                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text('Kaydedildi'),
                            content: Text('Form başarıyla kaydedildi.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context)
                                      .popUntil((r) => r.isFirst);
                                },
                                child: Text('Tamam'),
                              )
                            ],
                          ),
                        );
                      }
                    },
                    child: Text('Gönder'),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => SurveySelectionPage()),
                );
              },
              child: Text('Diğer Anketler'),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------ Şikayet Sayfası ------------------
class ComplaintPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Şikayet')),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Text('Şikayetinizi yazın:'),
            SizedBox(height: 12),
            TextField(maxLines: 6, decoration: InputDecoration(border: OutlineInputBorder())),
            SizedBox(height: 12),
            ElevatedButton(onPressed: () => Navigator.pop(context), child: Text('Gönder')),
          ],
        ),
      ),
    );
  }
}

// ------------------ İletişim Sayfası ------------------
class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('İletişim')),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('İletişim Bilgileri:', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Email: info@example.com'),
            Text('Telefon: +90 555 555 55 55'),
            SizedBox(height: 12),

            Text('Kaydedilmiş Formlar:', style: TextStyle(fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView(
                children: SurveyStorage.savedForms.map((f) {
                  return ListTile(
                    title: Text(f['isim'] ?? ''),
                    subtitle: Text("${f['anket']} - ${f['tarih']!.substring(0, 19)}"),
                  );
                }).toList(),
              ),
            ),

            ElevatedButton(onPressed: () => Navigator.pop(context), child: Text('Geri')),
          ],
        ),
      ),
    );
  }
}
