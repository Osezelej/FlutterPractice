import 'package:agric_fresh_app/screens/EditProduct.dart';
import 'package:agric_fresh_app/screens/Profile.dart';
import 'package:agric_fresh_app/screens/help.dart';
import 'package:agric_fresh_app/screens/pedingUpload.dart';
import 'package:agric_fresh_app/screens/resetpass.dart';
import 'package:agric_fresh_app/screens/signup.dart';
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
import 'package:supabase_flutter/supabase_flutter.dart';
import 'config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(anonKey: supabase_key, url: supabase_url);
  runApp(const Home());
}

final supabase = Supabase.instance.client;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class User_ {
  String id;
  String farmName;
  String farmOwnerName;
  String phoneNumber;
  String trxPin;
  String email;
  dynamic imageUrl;
  String pickUpaddr;

  User_({
    required this.id,
    required this.farmName,
    required this.farmOwnerName,
    required this.phoneNumber,
    required this.trxPin,
    required this.email,
    required this.imageUrl,
    required this.pickUpaddr,
  });
}

class _HomeState extends State<Home> {
  final User_ appUser = User_(
    id: '',
    farmName: '',
    farmOwnerName: '',
    phoneNumber: '',
    trxPin: '',
    email: '',
    imageUrl: '',
    pickUpaddr: '',
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => LoginIn(
              supabase: supabase,
              appuser: appUser,
            ),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/signup':
            return PageTransition(
                duration: const Duration(milliseconds: 500),
                child: SignUp(supabase: supabase),
                type: PageTransitionType.rightToLeft,
                settings: settings);
          case '/resetPassword':
            return PageTransition(
                duration: const Duration(milliseconds: 500),
                child: ResetPswrd(
                  appuser: appUser,
                ),
                type: PageTransitionType.rightToLeft,
                settings: settings);
          case '/forgotPassword':
            return PageTransition(
                duration: const Duration(milliseconds: 500),
                child: ForgotPswrd(appuser: appUser),
                type: PageTransitionType.rightToLeft,
                settings: settings);
          case '/transaction':
            return PageTransition(
                duration: const Duration(milliseconds: 500),
                child: TransactionHistory(
                  appuser: appUser,
                ),
                type: PageTransitionType.rightToLeft,
                settings: settings);
          case '/upload product':
            return PageTransition(
                duration: const Duration(milliseconds: 500),
                child: const UploadProduct(),
                type: PageTransitionType.rightToLeft,
                settings: settings);

          case '/Negotiation':
            return PageTransition(
                duration: const Duration(milliseconds: 500),
                child: const Negotiation(),
                type: PageTransitionType.rightToLeft,
                settings: settings);
          case '/product-chat':
            return PageTransition(
                duration: const Duration(milliseconds: 500),
                child: const ProductChat(),
                type: PageTransitionType.rightToLeft,
                settings: settings);
          case '/singleChat':
            return PageTransition(
                duration: const Duration(milliseconds: 500),
                child: const Chat(),
                type: PageTransitionType.rightToLeft,
                settings: settings);
          case '/uploadedProduct':
            return PageTransition(
                duration: const Duration(milliseconds: 500),
                child: const Product(),
                type: PageTransitionType.rightToLeft,
                settings: settings);
          case '/editProduct':
            return PageTransition(
                duration: const Duration(milliseconds: 500),
                child: const ProductDetails(),
                type: PageTransitionType.bottomToTop,
                settings: settings);
          case '/withdraw':
            return PageTransition(
                duration: const Duration(milliseconds: 500),
                child: const Widthdraw(),
                type: PageTransitionType.bottomToTop,
                settings: settings);
          case '/profile':
            return PageTransition(
                duration: const Duration(milliseconds: 500),
                child: const Profile(),
                type: PageTransitionType.fade,
                settings: settings);
          case '/pendingUpload':
            return PageTransition(
                duration: const Duration(milliseconds: 500),
                child: const PendingUpload(),
                type: PageTransitionType.rightToLeft,
                settings: settings);
          case '/help':
            return PageTransition(
                duration: const Duration(milliseconds: 500),
                child: const Help(),
                type: PageTransitionType.rightToLeft,
                settings: settings);
          default:
            return null;
        }
      },
    );
  }
}
