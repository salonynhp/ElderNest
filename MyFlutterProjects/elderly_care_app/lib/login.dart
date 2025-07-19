import 'package:flutter/material.dart';
import 'app_styles.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login', style: AppStyles.headingMedium),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: AppStyles.pagePadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please Login',
              style: AppStyles.headingLarge,
            ),
            SizedBox(height: 24),

            TextField(
              decoration: AppStyles.textFieldDecoration.copyWith(labelText: 'Email'),
            ),
            SizedBox(height: 16),

            TextField(
              decoration: AppStyles.textFieldDecoration.copyWith(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 24),

            ElevatedButton(
              style: AppStyles.elevatedButtonStyle,
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Text('Login'),
            ),
            SizedBox(height: 16),

            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text('Don\'t have an account? Register'),
            ),
          ],
        ),
      ),
    );
  }
}
