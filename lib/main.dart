import 'package:flutter/material.dart';
import 'package:agric_fresh_app/screens/TransactionHistory.dart';
import 'package:agric_fresh_app/screens/upladNewItem.dart';
// ignore: depend_on_referenced_packages
import 'package:page_transition/page_transition.dart';
import 'package:agric_fresh_app/screens/Negotiation.dart';
import 'package:agric_fresh_app/screens/SingleNegotiation.dart';
import 'package:agric_fresh_app/screens/Chat.dart';

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

        case '/Negotiation':
          return PageTransition(
              child: const Negotiation(),
              type: PageTransitionType.rightToLeft,
              settings: settings);
        case '/product-chat':
          return PageTransition(
              child: const ProductChat(),
              type: PageTransitionType.rightToLeft,
              settings: settings);
        case '/singleChat':
          return PageTransition(
              child: const Chat(),
              type: PageTransitionType.rightToLeft,
              settings: settings);
        default:
          return null;
      }
    },
  ));
}
