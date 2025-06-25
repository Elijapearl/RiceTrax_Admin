import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Error state
  String? _emailError;
  String? _passwordError;

  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    setState(() {
      // Reset errors
      _emailError = null;
      _passwordError = null;

      // Simulate validation
      if (email.isEmpty || !email.contains('@')) {
        _emailError = "Invalid email";
      }
      if (password.isEmpty || password.length < 6) {
        _passwordError = "Password must be at least 6 characters";
      }

      // If there are no errors, perform the login action
      if (_emailError == null && _passwordError == null) {
        print("Logging in: $email / $password");
        // Add your login logic here
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 60, 30, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo centered
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue[100],
                      ),
                      child: Icon(
                        Icons.person,
                        size: 60,
                        color: Colors.blue[800],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Welcome to MyApp',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),

              // Email
              Text("Email:", style: TextStyle(fontSize: 16)),
              SizedBox(height: 5),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter email',
                  errorText: _emailError, // Show email error here
                ),
              ),
              SizedBox(height: 20),

              // Password
              Text("Password:", style: TextStyle(fontSize: 16)),
              SizedBox(height: 5),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter password',
                  errorText: _passwordError, // Show password error here
                ),
              ),
              SizedBox(height: 30),

              // Login Button centered
              Center(
                child: ElevatedButton(
                  onPressed: _login,
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 15.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
