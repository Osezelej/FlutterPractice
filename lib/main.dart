import 'package:flutter/material.dart';
import 'package:agric_fresh_app/screens/TransactionHistory.dart';
import 'package:agric_fresh_app/screens/upladNewItem.dart';
// ignore: depend_on_referenced_packages
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const TransactionHistory(),
      // '/upload product': (context) => UploadProduct(),
    },
    onGenerateRoute: (settings) {
      switch (settings.name) {
        case '/upload product':
          return PageTransition(
              child: const UploadProduct(),
              type: PageTransitionType.rightToLeft,
              settings: settings);

        default:
          return null;
      }
    },
  ));
}
