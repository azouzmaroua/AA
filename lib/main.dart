import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_parfum/Core/SizeConfig.dart';
import 'package:my_parfum/auth/login.dart';
import 'package:my_parfum/functions/choesImage.dart';
import 'package:my_parfum/route.dart';
import 'package:my_parfum/routes/home_Screen/Home.dart';
import 'package:my_parfum/routes/loginScreen.dart';
import 'package:my_parfum/routes/order_Screen/newOrderScreen.dart';
import 'package:my_parfum/routes/produit_screens/Parfum/ParfumGalleryImagesScreen.dart';
import 'package:my_parfum/routes/produit_screens/Parfum/parfumScreen.dart';
import 'package:my_parfum/routes/produit_screens/productScreen.dart';
import 'package:my_parfum/routes/splashScreen.dart';
import 'package:my_parfum/routes/ventes_screens/ventes_screen.dart';
import 'package:my_parfum/test.dart';
import 'package:my_parfum/theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
      create: (context) => ChoesImageProvide(), child: MyParfum()));
}

class MyParfum extends StatelessWidget {
  const MyParfum({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      showSemanticsDebugger: false,
      title: 'MYPARFUM',
      routes: routesFilex,
      theme: mythem,
      home: SplashScreen(),
    );
  }
}
