import 'package:flutter/material.dart';
import 'app_styles.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register', style: AppStyles.headingMedium),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: AppStyles.pagePadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Create an Account',
              style: AppStyles.headingLarge,
            ),
            SizedBox(height: 20),

            TextField(
              decoration: AppStyles.textFieldDecoration.copyWith(labelText: 'Full Name'),
            ),
            SizedBox(height: 16),

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
                // Add registration logic here
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
