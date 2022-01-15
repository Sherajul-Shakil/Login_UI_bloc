import 'package:flutter/material.dart';
import 'bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: Column(
        children: [
          emailField(),
          passwordField(),
          Container(
            margin: const EdgeInsets.only(top: 25.0),
          ),
          submitButton(),
        ],
      ),
    );
  }

  emailField() {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email Address',
              hintText: 'user@mail.com',
              errorText: snapshot.hasError ? '${snapshot.error}' : null,
            ),
          );
        });

    // ignore: dead_code, unused_label
  }

  passwordField() {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changePassword,
            decoration: InputDecoration(
              labelText: 'Enter Password',
              hintText: 'password',
              errorText: snapshot.hasError ? '${snapshot.error}' : null,
            ),
            obscureText: true,
          );
        });

    // ignore: dead_code, unused_label
  }

  submitButton() {
    return RaisedButton(
      child: const Text('Login'),
      padding: const EdgeInsets.all(5.0),
      color: Colors.blue,
      onPressed: () {},
    );
  }
}
