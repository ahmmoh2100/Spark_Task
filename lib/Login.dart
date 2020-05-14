import 'package:flutter/material.dart';

import './Auth_Fun.dart';
import './Home.dart';
import './Animation.dart';
import './Register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailKey = GlobalKey<FormState>();
  final passwordKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    ComplexAnimation(
                      imgURL: "img/L.png",
                    ),
                    ComplexAnimation(
                      imgURL: "img/O.png",
                    ),
                    ComplexAnimation(
                      imgURL: "img/G.png",
                    ),
                    ComplexAnimation(
                      imgURL: "img/I.png",
                    ),
                    ComplexAnimation(
                      imgURL: "img/N.png",
                    )
                  ],
                ),
              ),
              Form(
                //email Field
                key: emailKey,
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'use email that contain @ and .',
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
              RaisedButton(
                onPressed: () async {
                  if (emailKey.currentState.validate() &&
                      passwordKey.currentState.validate()) {
                    dynamic user = await loginWithEmailAndPassword(
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
                                child: Text('Fail To Login',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              ),
                            );
                          });
                    }
                  }
                },
                child: Text('Login'),
              ),
              FlatButton(
                onPressed: (){
                  register(context);
                },
                 child: Text('Register',style: TextStyle(color: Colors.blue,fontStyle: FontStyle.italic,),)
              )
            ],
          ),
        ),
      ),
    );
  }
}
