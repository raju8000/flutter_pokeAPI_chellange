import 'package:flutter/material.dart';

class DialogHelper {
  static  showWarningDialog(BuildContext context, String message) {
    return showDialog(
      context: context,

      builder: (BuildContext context) {
        return AlertDialog(
          content: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(message, style: const TextStyle(fontSize: 15),),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}