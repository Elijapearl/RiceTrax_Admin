import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN FORM'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 50.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Email:", style: TextStyle(fontSize: 16)),
            SizedBox(height: 5),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter email',
              ),
            ),
            SizedBox(height: 20),
            Text("Password:", style: TextStyle(fontSize: 16)),
            SizedBox(height: 5),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter password',
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add login logic here
                  print("Email: ${_emailController.text}");
                  print("Password: ${_passwordController.text}");
                },
                child: Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
