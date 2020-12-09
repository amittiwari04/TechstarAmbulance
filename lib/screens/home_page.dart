import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:map_launcher/map_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool data = false;

  getReq() {
    final user = FirebaseAuth.instance.currentUser;

    final ref = FirebaseDatabase.instance
        .reference()
        .child('AdminAccess')
        .child('2f5mtvPMoaRFMBcUdh9XsNl0tQa2').child('ambulances')
        .child(user.uid)
        .child('req')
        .onValue;
    ref.listen((event) {
      final snapShot = event.snapshot.value;
      if (snapShot != null) {
        print(snapShot);
        setState(() {
          data = true;
        });
      }
    });
  }

  @override
  void initState() {
    getReq();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ambulance'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          data
              ? FlatButton.icon(
                  onPressed: () async {
                    if (await MapLauncher.isMapAvailable(MapType.google)) {
                      await MapLauncher.showDirections(
                          destination: Coords(27.140919, 78.004322),
                          mapType: MapType.google,
                          origin: Coords(27.171061, 78.040501));
                    }
                  },
                  icon: Icon(Icons.add_alert),
                  label: Text('Alert'),
                )
              : Text('No req as of now'),
        ],
      ),
    );
  }
}
