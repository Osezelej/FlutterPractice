import 'package:agric_fresh_app/screens/EditProduct.dart';
import 'package:agric_fresh_app/screens/Profile.dart';
import 'package:agric_fresh_app/screens/help.dart';
import 'package:agric_fresh_app/screens/pedingUpload.dart';
import 'package:agric_fresh_app/screens/withdraw.dart';
import 'package:flutter/material.dart';
import 'package:agric_fresh_app/screens/TransactionHistory.dart';
import 'package:agric_fresh_app/screens/upladNewItem.dart';
// ignore: depend_on_referenced_packages
import 'package:page_transition/page_transition.dart';
import 'package:agric_fresh_app/screens/Negotiation.dart';
import 'package:agric_fresh_app/screens/SingleNegotiation.dart';
import 'package:agric_fresh_app/screens/Chat.dart';
import 'package:agric_fresh_app/screens/product.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      useMaterial3: true,
    ),
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
        case '/uploadedProduct':
          return PageTransition(
              child: const Product(),
              type: PageTransitionType.rightToLeft,
              settings: settings);
        case '/editProduct':
          return PageTransition(
              child: const ProductDetails(),
              type: PageTransitionType.bottomToTop,
              settings: settings);
        case '/withdraw':
          return PageTransition(
              child: const Widthdraw(),
              type: PageTransitionType.bottomToTop,
              settings: settings);
        case '/profile':
          return PageTransition(
              child: const Profile(),
              type: PageTransitionType.fade,
              settings: settings);
        case '/pendingUpload':
          return PageTransition(
              child: const PendingUpload(),
              type: PageTransitionType.rightToLeft,
              settings: settings);
        case '/help':
          return PageTransition(
              child: const Help(),
              type: PageTransitionType.rightToLeft,
              settings: settings);
        default:
          return null;
      }
    },
  ));
}
