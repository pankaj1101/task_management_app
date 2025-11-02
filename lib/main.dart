import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Home()));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final urlController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 20,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  maxLines: 4,
                  controller: urlController,
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter URL',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 16,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1.2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.blueAccent,
                        width: 1.6,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.redAccent,
                        width: 1.5,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.redAccent,
                        width: 1.5,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'URL cannot be empty';
                    }

                    final pattern =
                        r'^(https?:\/\/)?([a-zA-Z0-9.-]+)(:[0-9]+)?(\/.*)?$';
                    final regex = RegExp(pattern);

                    if (!regex.hasMatch(value.trim())) {
                      return 'Please enter a valid URL';
                    }

                    if (!value.trim().startsWith('http')) {
                      return 'URL must start with http:// or https://';
                    }

                    return null;
                  },
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    elevation: 4,
                    shadowColor: Colors.blueAccent.withValues(alpha: 0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 14,
                    ),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print('URL: ${urlController.text}');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AppPage(url: urlController.text),
                        ),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppPage extends StatefulWidget {
  final String url;
  const AppPage({super.key, required this.url});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  List posts = [];
  bool isLoading = true;
  String message = '';

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    final url = Uri.parse(widget.url);
    try {
      final response = await get(url);

      print('*********************Response****************************');
      print('debug:: $response ');
      print('debug status code :: ${response.statusCode} ');
      print('debug response body :: ${response.body} ');
      print('***********************Response**************************');

      if (response.statusCode == 200) {
        setState(() {
          message =
              '✅ API request successful!\nStatus Code : ${response.statusCode}\nResponse : ${response.body}';
          isLoading = false;
        });
      } else {
        setState(() {
          message =
              '🚫 Server returned status code: ${response.statusCode}\nResponse : ${response.body}';
          isLoading = false;
        });
      }
    } catch (e) {
      print('***********************Error**************************');

      print('debug Error:: ${e}');

      setState(() {
        message = '❌ Error: $e';
        isLoading = false;
      });
      print('***********************Error**************************');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isSuccess = message.contains('✅');
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body:
          isLoading
              ? Center(child: CircularProgressIndicator())
              : Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Card(
                    color:
                        isSuccess ? Colors.green.shade50 : Colors.red.shade50,
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Text(
                          message,

                          style: TextStyle(
                            color:
                                isSuccess
                                    ? Colors.green.shade700
                                    : Colors.red.shade700,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
    );
  }
}
