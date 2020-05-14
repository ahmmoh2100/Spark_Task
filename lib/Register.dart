import 'package:flutter/material.dart';

import './Home.dart';
import './Auth_Fun.dart';

Future register(BuildContext context) async {
  final emailKey = GlobalKey<FormState>();
  final passwordKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  return showDialog(
    context: context,
    child: AlertDialog(
      title: Text("Registration"),
      content: Container(
        child: Column(
          children: <Widget>[
            Form(
              //email Field
              key: emailKey,
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'use @ and .com',
                  labelText: 'Email',
                ),
                validator: (String value) {
                  if (value == null) return 'Enter Email';
                  if (!value.contains('@') || !value.contains('.'))
                    return "Invaled Email";
                  return null;
                },
              ),
            ),
            Container(
              height: 20,
            ),
            Form(
              //password Field
              key: passwordKey,
              child: TextFormField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'use symbol',
                  labelText: 'Password',
                ),
                validator: (String value) {
                  if (value == null) return 'Enter Password';
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Register"),
          onPressed: () async {
            if (emailKey.currentState.validate() &&
                passwordKey.currentState.validate()) {
              dynamic user = await registerWithEmailAndPass(
                  emailController.text, passwordController.text);
              if (user != null) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(
                              userName: user,
                            )));
              } else {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Text(
                            'Use Correct Email like account@email.com',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    });
              }
            }
          },
        ),
        FlatButton(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
