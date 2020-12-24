import 'package:flutter/material.dart';

void showErrorDialog(BuildContext context, String message) => showDialog(
    context: context,
    child: AlertDialog(
      title: Text("حدث خطأ"),
      content: Text(message),
      actions: [
        FlatButton(
            onPressed: () => Navigator.of(context).pop(), child: Text("حسناً"))
      ],
    ));
