import 'package:flutter/material.dart';
import 'package:hospital_ambulance_app/modals/map_utils.dart';

class HomePage extends StatelessWidget {
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you ready?'),
          content: Text("Is the ambulance ready to bring the patient?"),
          actions: [
            FlatButton(
              child: Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("Yes"),
              onPressed: () {
                MapUtils.openMap(-3.823216, -38.481700);
              },
            ),
          ],
        );
      },
    );
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
          FlatButton.icon(
            onPressed: () {
              _showDialog(context);
            },
            icon: Icon(Icons.add_alert),
            label: Text('Alert'),
          ),
        ],
      ),
    );
  }
}
