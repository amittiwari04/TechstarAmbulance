import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hospital_ambulance_app/services/authService.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  TextEditingController passController = TextEditingController();
  dynamic user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .5,
                width: MediaQuery.of(context).size.width * .6,
                child: Image.asset('assets/logo.png'),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 20,
                  width: MediaQuery.of(context).size.width * .6,
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(hintText: 'Email'),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 20,
                width: MediaQuery.of(context).size.width * .6,
                child: TextField(
                  obscureText: true,
                  controller: passController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                      onPressed: () {
                        setState(() {
                          isLoading = true;
                        });
                        AuthService()
                            .signinWithEmail(emailController.text,
                                passController.text, context)
                            .then((value) {
                          setState(() {
                            isLoading = false;
                          });
                        }).then((_) {});
                      },
                      child: Row(
                        children: [
                          isLoading
                              ? SpinKitWave(
                                  color: Colors.green,
                                  size: 10,
                                )
                              : Icon(Icons.login),
                          SizedBox(
                            width: 3,
                          ),
                          Text('Sign in'),
                        ],
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
