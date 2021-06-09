import 'package:flutter/material.dart';
import 'package:login_app/components/logo.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: Column(
          children: [
            SizedBox(height: 200),
            Logo("Care Soft"),
            SizedBox(height: 50),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("환영합니다.")));
              },
              child: Text("Get Started"),
            )
          ],
        ),
      ),
    );
  }
}
