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
    Question(text: 'Question 1', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 2', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 3', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 4', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 5', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 6', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 7', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 8', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 9', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 10', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 11', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 12', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 13', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 14', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 15', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 16', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 17', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 18', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 19', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 20', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
  ],
  'Technology Survey': [
    Question(text: 'Question 1', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 2', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 3', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 4', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 5', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 6', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 7', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 8', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 9', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 10', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 11', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 12', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 13', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 14', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 15', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 16', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 17', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 18', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 19', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 20', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
  ],
  'Health Survey': [
    Question(text: 'Question 1', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 2', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 3', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 4', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 5', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 6', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 7', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 8', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 9', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 10', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 11', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 12', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 13', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 14', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 15', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 16', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 17', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 18', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 19', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
    Question(text: 'Question 20', options: ['A', 'B', 'C'], correctIndex: 0, explanation: ''),
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

// ------------------ Complaint Storage ------------------
class Complaint {
  final String name;
  final String type;
  final String email;
  final String comments;
  final String date;

  Complaint({required this.name, required this.type, required this.email, required this.comments, required this.date});
}

class ComplaintStorage {
  static final List<Complaint> complaints = [];

  static void saveComplaint(String name, String type, String email, String comments) {
    complaints.add(Complaint(name: name, type: type, email: email, comments: comments, date: DateTime.now().toString()));
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
          // Calculate score
          int correct = 0;
          for (int i = 0; i < questions.length; i++) {
            if (answers[i] != null && answers[i] == questions[i].correctIndex) correct++;
          }

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => ResultPage(
                surveyTitle: widget.surveyTitle,
                correctCount: correct,
                total: questions.length,
              ),
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
class ComplaintPage extends StatefulWidget {
  @override
  _ComplaintPageState createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _type = '';
  String _comments = '';

  final List<String> _types = [
    'App',
    'Questions',
    'Technical',
    'Content',
    'Payments',
    'Other',
  ];

  @override
  void initState() {
    super.initState();
    _type = _types.first;
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    ComplaintStorage.saveComplaint(_name, _type, _email, _comments);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Submitted'),
        content: Text('Your complaint has been submitted.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Complaint')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Submit a complaint', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (v) => v == null || v.isEmpty ? 'Name required' : null,
                onSaved: (v) => _name = v!.trim(),
              ),
              SizedBox(height: 12),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Complaint Type'),
                value: _type,
                items: _types.map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
                onChanged: (v) => setState(() => _type = v ?? _types.first),
                onSaved: (v) => _type = v ?? _types.first,
              ),
              SizedBox(height: 12),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (v) => v == null || v.isEmpty ? 'Email required' : null,
                onSaved: (v) => _email = v!.trim(),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 12),
              TextFormField(
                decoration: InputDecoration(labelText: 'Additional Comments'),
                maxLines: 5,
                onSaved: (v) => _comments = v?.trim() ?? '',
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancel')),
                  SizedBox(width: 8),
                  ElevatedButton(onPressed: _submit, child: Text('Submit')),
                ],
              ),
            ],
          ),
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

// ------------------ Result Page ------------------
class ResultPage extends StatelessWidget {
  final String surveyTitle;
  final int correctCount;
  final int total;

  ResultPage({required this.surveyTitle, required this.correctCount, required this.total});

  String _selectMessage(double percent) {
    if (percent == 100) return 'Message 1';
    if (percent >= 90) return 'Message 2';
    if (percent >= 80) return 'Message 3';
    if (percent >= 70) return 'Message 4';
    if (percent >= 60) return 'Message 5';
    if (percent >= 50) return 'Message 6';
    if (percent >= 40) return 'Message 7';
    if (percent >= 30) return 'Message 8';
    if (percent >= 20) return 'Message 9';
    if (percent >= 10) return 'Message 10';
    return 'Message 11';
  }

  @override
  Widget build(BuildContext context) {
    final percent = (correctCount / total) * 100.0;
    final message = _selectMessage(percent);

    return Scaffold(
      appBar: AppBar(title: Text('Result')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(surveyTitle, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            SizedBox(height: 24),
            Text('${percent.toStringAsFixed(1)}% correct', style: TextStyle(fontSize: 32), textAlign: TextAlign.center),
            SizedBox(height: 24),
            Text(message, style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
            SizedBox(height: 36),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => SurveyCompletePage(surveyTitle: surveyTitle)),
                );
              },
              child: Text('Continue to Completion Form'),
            ),
            SizedBox(height: 8),
            OutlinedButton(
              onPressed: () => Navigator.of(context).popUntil((r) => r.isFirst),
              child: Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}