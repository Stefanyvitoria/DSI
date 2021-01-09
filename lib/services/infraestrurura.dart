import 'package:flutter/material.dart';

final dsihelper = _DSIHelper();

class _DSIHelper {
  void showAlert({
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

  void showMessage({
    context,
    message = 'Operação realizada com sucesso.',
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}
