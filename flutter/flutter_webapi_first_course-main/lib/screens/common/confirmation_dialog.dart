import 'package:flutter/material.dart';

showConfirmationDialog(
  BuildContext context, {
  String title = "Atenção",
  String content = "Tem certeza?",
  String cancelLabel = "Não",
  String confirmLabel = "Sim",
}) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: Text(cancelLabel),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Text(
              confirmLabel.toUpperCase(),
              style: const TextStyle(
                  color: Colors.brown, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );
    },
  );
}
