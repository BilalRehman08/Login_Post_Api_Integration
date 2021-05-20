import 'package:flutter/material.dart';
import 'package:task/services/remote/api.dart';

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
  final formKey = GlobalKey<FormState>();

  void submitForm() async {
    final check = formKey.currentState?.validate();
    if (check ?? false) {
      ApiService _apiService = ApiService();

      final allUsers = await _apiService.getAllUsers();
      final user = allUsers
          .firstWhere((user) => user.username == userNameCtrl.text.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: userNameCtrl,
              validator: (val) {
                if (val != null && val.isEmpty) {
                  return "This field must not be empty";
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: submitForm,
              child: Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}
