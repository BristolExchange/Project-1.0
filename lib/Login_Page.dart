import 'package:flutter/gestures.dart';
import 'package:bristol_exchange/Deco_design.dart';
import 'package:flutter/material.dart';
import 'package:bristol_exchange/Forgotpassword.dart';

import 'package:bristol_exchange/Registerpage.dart';

import 'Registerpage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  String? name, email, phone;

  //TextController to read text entered in text field
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final GlobalKey<FormState> _globalkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Login Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            top: /*MediaQuery.of(context).size.height * 0.15*/ 0),
        child: SizedBox(
          //height: 200,
          width: double.infinity,

          child: Form(
            key: _globalkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 15, left: 10, right: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          decoration:
                              buildInputDecoration(Icons.email, "Email"),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'An E-mail is required to Login.';
                            }
                            if (!RegExp(
                                    "^[a-z,A-Z,0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return 'Please a valid E-mail';
                            }
                            return null;
                          },
                          onSaved: (String? value) {
                            email = value;
                          },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 15, left: 10, right: 10),
                        child: TextFormField(
                          controller: confirmpassword,
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration:
                              buildInputDecoration(Icons.lock, "Password"),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please re-enter password';
                            }
                            print(password.text);

                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 30),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.60,
                        height: 50,
                        child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(30),
                            ),
                            child: RaisedButton(
                              color: Colors.blueAccent,
                              onPressed: () {
                                if (_globalkey.currentState!.validate()) {
                                  print("successful");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            //set this to home screen
                                            const Login()),
                                  );
                                  return;
                                } else {
                                  print("UnSuccessfull");
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  side: const BorderSide(
                                      color: Colors.blue, width: 2)),
                              textColor: Colors.white,
                              child: const Text("LOGIN"),
                              // style: ElevatedButton.styleFrom(primary: Colors.black26,textStyle: const TextStyle(color: Colors.black,fontSize: 20,))
                            )),
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.60,
                        height: 50,
                        child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(30),
                            ),
                            child: RaisedButton(
                              color: Colors.blueAccent,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterPage()),
                                );
                                return;
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  side: const BorderSide(
                                      color: Colors.blue, width: 2)),
                              textColor: Colors.white,
                              child: const Text("REGISTER"),
                              // style: ElevatedButton.styleFrom(primary: Colors.black26,textStyle: const TextStyle(color: Colors.black,fontSize: 20,))
                            )),
                      ),

                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Forgot Password?',
                              style: const TextStyle(
                                color: Colors.blue,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Forgotpassword()));
                                }),
                        ]),
                      ),

                      //sizedbox
                    ], //children
                  ), //Column
                ),

                //sizedbox
              ], //children
            ), //column
          ), //center// Foreground widget here
        ),
      ), //padding
    );
  }
}
