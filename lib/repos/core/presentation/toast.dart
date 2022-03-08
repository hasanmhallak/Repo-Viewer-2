import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

Future<void> showToast(BuildContext context, String message) async {
  return showFlash(
    context: context,
    builder: (context, controller) {
      return Flash.dialog(
        margin: const EdgeInsets.all(8.0),
        borderRadius: BorderRadius.circular(10),
        backgroundColor: Colors.black.withOpacity(0.7),
        controller: controller,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      );
    },
  );
}
