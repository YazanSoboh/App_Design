import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Survey App - DartPad',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: HomePage(),
    );
  }
}

// Simple model for questions
class Question {
  final String text;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  Question({required this.text, required this.options, required this.correctIndex, this.explanation = ''});
}

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
  'Psychological Test': List.generate(10, (i) => Question(text: 'Item ${i+1}', options: [''], correctIndex: 0, explanation: '')),
};

// ------------------ Form Storage ------------------
class SurveyStorage {
  static final List<Map<String, String>> savedForms = [];

  // Save a full form data map. Expects keys like: survey, name, surname, age, nationality, gender, email, rating
  static void saveForm(Map<String, String> data) {
    final entry = Map<String, String>.from(data);
    entry['date'] = DateTime.now().toString();
    savedForms.add(entry);
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
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _shakeAnim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _shakeAnim = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: -8.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -8.0, end: 8.0), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 8.0, end: -6.0), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -6.0, end: 6.0), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 6.0, end: 0.0), weight: 1),
    ]).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _onStartPressed() async {
    if (_ctrl.isAnimating) return;

    void listener(AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _ctrl.removeStatusListener(listener);
        if (!mounted) return;
        Navigator.push(context, MaterialPageRoute(builder: (_) => SurveySelectionPage()));
      }
    }

    _ctrl.addStatusListener(listener);
    _ctrl.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome to the App')),
      body: Container(
        color: Colors.lightBlue.shade50,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Welcome to the Surveys!', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.blue[800])),
                    SizedBox(height: 16),
                    AnimatedBuilder(
                      animation: _shakeAnim,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(_shakeAnim.value, 0),
                          child: child,
                        );
                      },
                      child: ElevatedButton(
                        onPressed: _onStartPressed,
                        style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
                        child: Text('Start Survey'),
                      ),
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
class SurveySelectionPage extends StatefulWidget {
  const SurveySelectionPage({Key? key}) : super(key: key);

  @override
  _SurveySelectionPageState createState() => _SurveySelectionPageState();
}

class _SurveySelectionPageState extends State<SurveySelectionPage> {
  final assetNames = ['1.jpg', '2.jpg', '3.webp'];

  @override
  void initState() {
    super.initState();
    _checkAssets();
  }

  void _checkAssets() async {
    for (var i = 0; i < assetNames.length; i++) {
      final asset = 'assets/ads/images/${assetNames[i]}';
      try {
        final data = await rootBundle.load(asset);
        print('ASSET OK: $asset (${data.lengthInBytes} bytes)');
      } catch (e) {
        print('ASSET ERROR: $asset -> $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Survey Selection')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Builder(builder: (context) {
          final keys = surveys.keys.toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(keys.length, (i) {
              final title = keys[i];
              final asset = 'assets/ads/images/${assetNames.length > i ? assetNames[i] : '${i + 1}.jpg'}';

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => QuizPage(surveyTitle: title)),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        children: [
                          Image.asset(
                            asset,
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                            gaplessPlayback: true,
                            errorBuilder: (c, e, s) {
                              return Container(
                                width: double.infinity,
                                height: 200,
                                color: Colors.grey[300],
                                child: Center(child: Icon(Icons.broken_image, size: 48, color: Colors.grey[700])),
                              );
                            },
                          ),
                          Container(
                            width: double.infinity,
                            height: 200,
                            color: Colors.black.withOpacity(0.25),
                          ),
                          Positioned.fill(
                            child: Center(
                              child: Text('Go to Survey', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              );
            }),
          );
        }),
      ),
    );
  }
}

// ------------------ Quiz (Question Page) ------------------
class QuizPage extends StatefulWidget {
  final String surveyTitle;
  const QuizPage({Key? key, required this.surveyTitle}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late List<Question> questions;
  int currentIndex = 0;
  int? selectedOption;
  late List<int?> answers;
  late bool isTextSurvey;
  List<TextEditingController>? _seeControllers;
  List<TextEditingController>? _feelControllers;

  @override
  void initState() {
    super.initState();
    questions = surveys[widget.surveyTitle]!;
    answers = List<int?>.filled(questions.length, null);
    isTextSurvey = widget.surveyTitle == 'Psychological Test';
    if (isTextSurvey) {
      _seeControllers = List.generate(questions.length, (_) => TextEditingController());
      _feelControllers = List.generate(questions.length, (_) => TextEditingController());
    }
  }

  @override
  void dispose() {
    if (_seeControllers != null) {
      for (var c in _seeControllers!) c.dispose();
    }
    if (_feelControllers != null) {
      for (var c in _feelControllers!) c.dispose();
    }
    super.dispose();
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
    if (isTextSurvey) {
      final see = _seeControllers![currentIndex].text.trim();
      final feel = _feelControllers![currentIndex].text.trim();
      if (see.isEmpty || feel.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please answer both questions.')));
        return;
      }

      if (currentIndex < questions.length - 1) {
        setState(() => currentIndex++);
      } else {
        // final item: thank you dialog with options
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => AlertDialog(
            title: Text('Thank you'),
            content: Text('Thank you for participating in the survey.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).popUntil((r) => r.isFirst);
                },
                child: Text('Home'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => SurveyCompletePage(surveyTitle: widget.surveyTitle)),
                  );
                },
                child: Text('Continue to Completion Form'),
              ),
            ],
          ),
        );
      }
      return;
    }

    if (selectedOption == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please select an option.')));
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
        if (!isTextSurvey) selectedOption = answers[currentIndex];
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
                  if (isTextSurvey) ...[
                    // picture label
                    Text('Picture number ${currentIndex + 1}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    SizedBox(height: 8),
                    // show image for psychological test
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/ads/images/${currentIndex + 4}.jpg',
                        width: double.infinity,
                        height: 360,
                        fit: BoxFit.cover,
                        errorBuilder: (c, e, s) => Container(
                          width: double.infinity,
                          height: 360,
                          color: Colors.grey[300],
                          child: Center(child: Text('Image not found', style: TextStyle(color: Colors.black54))),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text('What do you see in this picture?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    TextField(
                      controller: _seeControllers![currentIndex],
                      maxLines: 3,
                      decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'Describe what you see'),
                    ),
                    SizedBox(height: 12),
                    Text('How does this picture make you feel?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    TextField(
                      controller: _feelControllers![currentIndex],
                      maxLines: 3,
                      decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'Describe your feelings'),
                    ),
                  ] else ...[
                    Text(q.text, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
  const SurveyCompletePage({Key? key, required this.surveyTitle}) : super(key: key);

  @override
  _SurveyCompletePageState createState() => _SurveyCompletePageState();
}

class _SurveyCompletePageState extends State<SurveyCompletePage> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String surname = '';
  String age = '';
  String nationality = '';
  String gender = '';
  String email = '';
  String rating = '5';

  final List<String> _genders = ['Male', 'Female', 'Other', 'Prefer not to say'];
  final List<String> _ratings = List.generate(10, (i) => '${i + 1}');

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
                    validator: (v) => v == null || v.isEmpty ? 'Name required' : null,
                    onSaved: (v) => name = v!.trim(),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Surname'),
                    validator: (v) => v == null || v.isEmpty ? 'Surname required' : null,
                    onSaved: (v) => surname = v!.trim(),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Age'),
                    keyboardType: TextInputType.number,
                    validator: (v) => v == null || v.isEmpty ? 'Age required' : null,
                    onSaved: (v) => age = v!.trim(),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Nationality'),
                    validator: (v) => v == null || v.isEmpty ? 'Nationality required' : null,
                    onSaved: (v) => nationality = v!.trim(),
                  ),
                  SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: 'Gender'),
                    value: gender.isEmpty ? _genders.first : gender,
                    items: _genders.map((g) => DropdownMenuItem(value: g, child: Text(g))).toList(),
                    onChanged: (v) => setState(() => gender = v ?? _genders.first),
                    onSaved: (v) => gender = v ?? _genders.first,
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (v) => v == null || v.isEmpty ? 'Email required' : null,
                    onSaved: (v) => email = v!.trim(),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: 'Rate this survey (1-10)'),
                    value: rating,
                    items: _ratings.map((r) => DropdownMenuItem(value: r, child: Text(r))).toList(),
                    onChanged: (v) => setState(() => rating = v ?? '5'),
                    onSaved: (v) => rating = v ?? '5',
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                        if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        SurveyStorage.saveForm({
                          'survey': widget.surveyTitle,
                          'name': name,
                          'surname': surname,
                          'age': age,
                          'nationality': nationality,
                          'gender': gender,
                          'email': email,
                          'rating': rating,
                        });

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
  const ComplaintPage({Key? key}) : super(key: key);

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
  const ContactPage({Key? key}) : super(key: key);

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
                  final displayName = "${f['name'] ?? ''} ${f['surname'] ?? ''}".trim();
                  return ListTile(
                    title: Text(displayName.isEmpty ? (f['name'] ?? '') : displayName),
                    subtitle: Text("${f['survey']} - ${f['date']!.substring(0, 19)}"),
                    trailing: Text(f['rating'] ?? ''),
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

  const ResultPage({Key? key, required this.surveyTitle, required this.correctCount, required this.total}) : super(key: key);
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