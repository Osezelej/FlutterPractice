import 'package:agric_fresh_app/screens/EditProduct.dart';
import 'package:agric_fresh_app/screens/Profile.dart';
import 'package:agric_fresh_app/screens/help.dart';
import 'package:agric_fresh_app/screens/pedingUpload.dart';
import 'package:agric_fresh_app/screens/resetpass.dart';
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
import 'package:agric_fresh_app/screens/login.dart';
import 'package:agric_fresh_app/screens/ForgotPass.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      useMaterial3: true,
    ),
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => LoginIn(),
      // '/upload product': (context) => UploadProduct(),
    },
    onGenerateRoute: (settings) {
      switch (settings.name) {
        case '/resetPassword':
          return PageTransition(
              duration: Duration(milliseconds: 500),
              child: const ResetPswrd(),
              type: PageTransitionType.rightToLeft,
              settings: settings);
        case '/forgotPassword':
          return PageTransition(
              duration: Duration(milliseconds: 500),
              child: const ForgotPswrd(),
              type: PageTransitionType.rightToLeft,
              settings: settings);
        case '/transaction':
          return PageTransition(
              duration: Duration(milliseconds: 500),
              child: const TransactionHistory(),
              type: PageTransitionType.rightToLeft,
              settings: settings);
        case '/upload product':
          return PageTransition(
              duration: Duration(milliseconds: 500),
              child: const UploadProduct(),
              type: PageTransitionType.rightToLeft,
              settings: settings);

        case '/Negotiation':
          return PageTransition(
              duration: Duration(milliseconds: 500),
              child: const Negotiation(),
              type: PageTransitionType.rightToLeft,
              settings: settings);
        case '/product-chat':
          return PageTransition(
              duration: Duration(milliseconds: 500),
              child: const ProductChat(),
              type: PageTransitionType.rightToLeft,
              settings: settings);
        case '/singleChat':
          return PageTransition(
              duration: Duration(milliseconds: 500),
              child: const Chat(),
              type: PageTransitionType.rightToLeft,
              settings: settings);
        case '/uploadedProduct':
          return PageTransition(
              duration: Duration(milliseconds: 500),
              child: const Product(),
              type: PageTransitionType.rightToLeft,
              settings: settings);
        case '/editProduct':
          return PageTransition(
              duration: Duration(milliseconds: 500),
              child: const ProductDetails(),
              type: PageTransitionType.bottomToTop,
              settings: settings);
        case '/withdraw':
          return PageTransition(
              duration: Duration(milliseconds: 500),
              child: const Widthdraw(),
              type: PageTransitionType.bottomToTop,
              settings: settings);
        case '/profile':
          return PageTransition(
              duration: Duration(milliseconds: 500),
              child: const Profile(),
              type: PageTransitionType.fade,
              settings: settings);
        case '/pendingUpload':
          return PageTransition(
              duration: Duration(milliseconds: 500),
              child: const PendingUpload(),
              type: PageTransitionType.rightToLeft,
              settings: settings);
        case '/help':
          return PageTransition(
              duration: Duration(milliseconds: 500),
              child: const Help(),
              type: PageTransitionType.rightToLeft,
              settings: settings);
        default:
          return null;
      }
    },
  ));
}
