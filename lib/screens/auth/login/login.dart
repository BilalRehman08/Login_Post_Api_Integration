import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  final userNameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: userNameCtrl,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}
