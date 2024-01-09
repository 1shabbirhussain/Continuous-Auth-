import 'package:flutter/material.dart';
import 'package:first_project/bloc/login_bloc.dart';

class Login extends StatelessWidget {
  const Login({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(16.0), // Add padding for better spacing
        child: Column(
          children: [
            emailField(),
            passwordField(),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return StreamBuilder<String>(
      stream: bloc.emailStream,
      builder: (context, AsyncSnapshot<String> snapshot) {
        return Container(
          margin: EdgeInsets.only(bottom: 16.0),
          child: TextField(
            onChanged: (value) => bloc.emailSink(value),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "you@example.com",
              labelText: "Email Address",
              errorText:
                  snapshot.error != null ? snapshot.error as String : null,
            ),
          ),
        );
      },
    );
  }

  Widget passwordField() {
    return StreamBuilder<String>(
      stream: bloc.passwordStream,
      builder: (context, AsyncSnapshot<String> snapshot) {
        return Container(
          margin: EdgeInsets.only(bottom: 16.0),
          child: TextField(
            onChanged: (value) => bloc.passwordSink(value),
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Password",
              labelText: "Password",
              errorText:
                  snapshot.error != null ? snapshot.error as String : null,
            ),
          ),
        );
      },
    );
  }

  Widget submitButton() {
    return Container(
      width: double.infinity, // Make the button take the full width
      child: ElevatedButton(
        onPressed: () {},
        child: Text("Submit"),
      ),
    );
  }
}
