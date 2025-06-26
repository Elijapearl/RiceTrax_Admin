import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? emailError;
  String? passwordError;

  void _validateInput() {
    setState(() {
      final email = _emailController.text.trim();
      final password = _passwordController.text;

      // Email Validation
      if (email.isEmpty) {
        emailError = 'Email is required';
      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
        emailError = 'Enter a valid email';
      } else {
        emailError = null;
      }

      // Password Validation
      if (password.isEmpty) {
        passwordError = 'Password is required';
      } else if (password.length < 6) {
        passwordError = 'Password must be at least 6 characters';
      } else {
        passwordError = null;
      }

      // Debug print (optional)
      print("Email: $email, Password: $password");

      // If no errors, proceed with login
      if (emailError == null && passwordError == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login successful!'),
            backgroundColor: Colors.green,
          ),
        );
        // You can navigate to the next screen here
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/palay.jpg',
            fit: BoxFit.cover,
          ),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                borderRadius: BorderRadius.circular(20),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset('assets/rice_logo.jpg', height: 60),
                    SizedBox(height: 16),
                    Text(
                      'Login to RiceTraX',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 24),


                    TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        errorText: emailError,
                      ),
                      onChanged: (_) => _validateInput(),
                    ),
                    SizedBox(height: 16),

                    // Password
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        errorText: passwordError,
                      ),
                      onChanged: (_) => _validateInput(),
                    ),
                    SizedBox(height: 12),

                    // Forgot Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text("Forgot Password?"),
                      ),
                    ),

                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber[700],
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: _validateInput,
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}