import 'package:flutter/material.dart';

class DSIHelper {
  void showMessage({
    context,
    title,
    message,
    onPressed,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                if (onPressed == null)
                  Navigator.of(context).pop();
                else
                  onPressed.call();
              },
            )
          ],
        );
      },
    );
  }
}
