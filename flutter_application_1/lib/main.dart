import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Survey App - DartPad',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: HomePage(),
    );
  }
}

// ------------------ Question Model ------------------
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

// ------------------ Survey Data ------------------
final Map<String, List<Question>> surveys = {
  'General Knowledge Survey': [
    Question(
      text: 'What is the capital of Turkey?',
      options: ['Istanbul', 'Ankara', 'Izmir'],
      correctIndex: 1,
      explanation: 'The capital of Turkey is Ankara.',
    ),
    Question(
      text: 'Which is the largest planet in the solar system?',
      options: ['Jupiter', 'Saturn'],
      correctIndex: 0,
      explanation: 'Jupiter is the largest planet.',
    ),
  ],
  'Technology Survey': [
    Question(
      text: 'Which language does Flutter use?',
      options: ['Dart', 'Java', 'Kotlin'],
      correctIndex: 0,
      explanation: 'Flutter apps are written in Dart.',
    ),
  ],
  'Health Survey': [
    Question(
      text: 'How many hours of sleep are recommended per day?',
      options: ['4-5', '7-9'],
      correctIndex: 1,
      explanation: '7-9 hours of sleep are recommended for adults.',
    ),
  ],
};

// ------------------ Form Storage ------------------
class SurveyStorage {
  static final List<Map<String, String>> savedForms = [];

  static void saveForm(String surveyTitle, String name, String email) {
    savedForms.add({
      'survey': surveyTitle,
      'name': name,
      'email': email,
      'date': DateTime.now().toString(),
    });
  }
}

// ------------------ Home Page ------------------
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome to the App')),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Welcome to the Surveys!', style: TextStyle(fontSize: 22)),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => SurveySelectionPage()),
                      );
                    },
                    child: Text('Start Survey'),
                  ),
                ],
              ),
            ),
          ),

          Container(
            height: 60,
            color: Colors.grey[300],
            child: Center(child: Text('AD SPACE (Home Bottom)')),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.report_problem), label: 'Complaint'),
          BottomNavigationBarItem(icon: Icon(Icons.contact_mail), label: 'Contact'),
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

// ------------------ Survey Selection Page ------------------
class SurveySelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Survey Selection')),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          Text('Available Surveys', style: TextStyle(fontSize: 18)),
          SizedBox(height: 8),
          ...surveys.keys.map((title) => Card(
                child: ListTile(
                  title: Text(title),
                  subtitle: Text('${surveys[title]!.length} questions'),
                  trailing: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => QuizPage(surveyTitle: title),
                        ),
                      );
                    },
                    child: Text('Start'),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

// ------------------ Quiz (Question Page) ------------------
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
        title: Text(correct ? 'Correct!' : 'Incorrect!',
            style: TextStyle(color: Colors.white)),
        content: Text(explanation, style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Close', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }

  void _nextQuestion() {
    if (selectedOption == null) {
        ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Please select an option.')));
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
          title: Text('${widget.surveyTitle} - Question ${currentIndex + 1}/${questions.length}')),
      body: Column(
        children: [
          if (showAd)
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.yellow[200],
              child: Center(child: Text('AD SPACE')),
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
                ElevatedButton(onPressed: _prevQuestion, child: Text('Back')),
                ElevatedButton(
                    onPressed: _nextQuestion,
                    child: Text(currentIndex < questions.length - 1
                        ? 'Next'
                        : 'Finish')),
                ElevatedButton(
                  onPressed: () =>
                      Navigator.of(context).popUntil((r) => r.isFirst),
                  child: Text('Home'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------ Survey Completed + Form Page ------------------
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
      appBar: AppBar(title: Text('Survey Completed')),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Text('Congratulations! Please fill the form.'),
            SizedBox(height: 12),

            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Name'),
                    validator: (v) => v!.isEmpty ? 'Name required' : null,
                    onSaved: (v) => name = v!,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (v) => v!.isEmpty ? 'Email required' : null,
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
                            title: Text('Saved'),
                            content: Text('Form saved successfully.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context)
                                      .popUntil((r) => r.isFirst);
                                },
                                child: Text('OK'),
                              )
                            ],
                          ),
                        );
                      }
                    },
                    child: Text('Submit'),
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
              child: Text('Other Surveys'),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------ Complaint Page ------------------
class ComplaintPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Complaint')),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Text('Write your complaint:'),
            SizedBox(height: 12),
            TextField(maxLines: 6, decoration: InputDecoration(border: OutlineInputBorder())),
            SizedBox(height: 12),
            ElevatedButton(onPressed: () => Navigator.pop(context), child: Text('Send')),
          ],
        ),
      ),
    );
  }
}

// ------------------ Contact Page ------------------
class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact')),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Contact Information:', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Email: info@example.com'),
            Text('Phone: +90 555 555 55 55'),
            SizedBox(height: 12),

            Text('Saved Forms:', style: TextStyle(fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView(
                children: SurveyStorage.savedForms.map((f) {
                  return ListTile(
                    title: Text(f['name'] ?? ''),
                    subtitle: Text("${f['survey']} - ${f['date']!.substring(0, 19)}"),
                  );
                }).toList(),
              ),
            ),

            ElevatedButton(onPressed: () => Navigator.pop(context), child: Text('Back')),
          ],
        ),
      ),
    );
  }
}