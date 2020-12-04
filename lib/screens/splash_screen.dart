
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hospital_ambulance_app/screens/home_page.dart';
import 'package:hospital_ambulance_app/screens/loginScreen.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    getcurrentUser();
  }

  Future<void> getcurrentUser() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {  
      Future.delayed(Duration(seconds: 3)).then((value) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen(),
          ),
        );
      });
      return;
    }
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .15,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.4,
              child: Image.asset('assets/logo.png'),
            ),
            Center(
              child: Text(
                'I   C   E',
                style: GoogleFonts.poppins(
                    color: HexColor("FA163F"), fontSize: 23,fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
