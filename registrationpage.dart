import 'package:flutter/material.dart';
import 'homepage.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  int gender = 1;
  bool agree = false;
  String errorText = '';

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void openHome() {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if (name.isEmpty || email.isEmpty || password.isEmpty || !agree) {
      setState(() {
        errorText = 'Please fill all fields and agree to the terms';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 10.0),
            const Text(
              'Create your account',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 15.0),
            SizedBox(
              width: 250.0,
              height: 50.0,
              child: TextField(
                controller: nameController,
                style: const TextStyle(fontSize: 18.0),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Full name',
                ),
              ),
            ),
            const SizedBox(height: 10.0),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Gender',
                  style: TextStyle(fontSize: 18.0),
                ),
                Radio<int>(
                  value: 1,
                  groupValue: gender,
                  onChanged: (val) {
                    if (val == null) return;
                    setState(() {
                      gender = val;
                    });
                  },
                ),
                const Text(
                  'Male',
                  style: TextStyle(fontSize: 18.0),
                ),
                Radio<int>(
                  value: 2,
                  groupValue: gender,
                  onChanged: (val) {
                    if (val == null) return;
                    setState(() {
                      gender = val;
                    });
                  },
                ),
                const Text(
                  'Female',
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: agree,
                  onChanged: (bool? value) {
                    if (value == null) return;
                    setState(() {
                      agree = value;
                    });
                  },
                ),
                const Text(
                  'I agree to the terms',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
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
