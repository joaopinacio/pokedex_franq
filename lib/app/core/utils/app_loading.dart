import 'package:flutter/material.dart';

class AppLoadingScreen {
  static loading(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).iconTheme.color!),
            ),
          ),
        );
      },
    );
  }
}
