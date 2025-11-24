import 'package:flutter/material.dart';
import 'registrationpage.dart';
import 'homepage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String errorText = '';

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void openHome() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      setState(() {
        errorText = 'Please fill all fields';
      });
    } else {
      setState(() {
        errorText = '';
      });
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  void openRegistration() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const RegistrationPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wazeefati'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            const Text(
              'Login to your account',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: 250.0,
              height: 50.0,
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(fontSize: 18.0),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              width: 250.0,
              height: 50.0,
              child: TextField(
                controller: passwordController,
                obscureText: true,
                style: const TextStyle(fontSize: 18.0),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              errorText,
              style: const TextStyle(fontSize: 16.0, color: Colors.red),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: openHome,
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: openRegistration,
              child: const Text(
                'Register',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
