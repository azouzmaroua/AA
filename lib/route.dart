import 'package:flutter/material.dart';
import 'package:my_parfum/auth/otpscreen.dart';
import 'package:my_parfum/routes/home_Screen/Home.dart';
import 'package:my_parfum/routes/Onboarding_screens/OnBoardingBody.dart';
import 'package:my_parfum/routes/home_Screen/la_caisse_Money.dart';
import 'package:my_parfum/routes/home_Screen/home_employee.dart';
import 'package:my_parfum/routes/home_Screen/users_Screen.dart';
import 'package:my_parfum/routes/loginScreen.dart';
import 'package:my_parfum/routes/order_Screen/newOrderScreen.dart';
import 'package:my_parfum/routes/order_Screen/print.dart';
import 'package:my_parfum/routes/order_Screen/screenChosingProduct.dart';
import 'package:my_parfum/routes/order_Screen/succesOrder.dart';
//Autres

import 'package:my_parfum/routes/produit_screens/Autres/AutresGalleryImagesScreen.dart';
import 'package:my_parfum/routes/produit_screens/Autres/AutresScreen.dart';
import 'package:my_parfum/routes/produit_screens/Autres/ScreenAddAutres.dart';
import 'package:my_parfum/routes/produit_screens/Autres/ScreenVeiwAutres.dart';
//Parfum

import 'package:my_parfum/routes/produit_screens/Parfum/ScreenAddParfum.dart';
import 'package:my_parfum/routes/produit_screens/Parfum/ScreenVeiwParfum.dart';
import 'package:my_parfum/routes/produit_screens/Parfum/ParfumGalleryImagesScreen.dart';
import 'package:my_parfum/routes/produit_screens/Parfum/parfumScreen.dart';
import 'package:my_parfum/routes/produit_screens/makeUp/ScreenAddMakeUp.dart';
//MakeUp

import 'package:my_parfum/routes/produit_screens/makeUp/ScreenVeiwMakeUp.dart';
import 'package:my_parfum/routes/produit_screens/makeUp/makeUpGalleryImagesScreen.dart';
import 'package:my_parfum/routes/produit_screens/makeUp/makeUpScreen.dart';

import 'package:my_parfum/routes/produit_screens/productScreen.dart';
import 'package:my_parfum/routes/splashScreen.dart';
import 'package:my_parfum/routes/statistiques_screens/StatistiquesScreen.dart';
import 'package:my_parfum/routes/statistiques_screens/ScreenfilterStatics.dart';
import 'package:my_parfum/routes/statistiques_screens/a.dart';
import 'package:my_parfum/routes/statistiques_screens/a/chart.dart';
import 'package:my_parfum/routes/statistiques_screens/static.dart';
import 'package:my_parfum/routes/ventes_screens/ventes_screen.dart';
import 'package:my_parfum/test.dart';

Map<String, Widget Function(BuildContext)> routesFilex = {
  "Test Screen": (context) => test(),
  "OnBoardingViewBody": (context) => OnBoardingViewBody(),
  // "OTP Screen": (context) => OTPScreen(),
  //==================================================================

  "MainPage Screen": (context) => MainPage(),

  "Login Screen": (context) => LoginScreen(),
  "home Screen": (context) => Home(),
  "home_emp Screen": (context) => Home_emp(),

  "La_case_Moeny Screen": (context) => La_case_Moeny(),
  "User Screen": (context) => User_Screen(),

  "ventes Screen": (context) => VentesScreen(),
  "Statistiques Screen": (context) => StatistiquesScreen(),
  "Screen filter Statics": (context) => ScreenfilterStatics(),

  "product Screen": (context) => productScreen(),
  //Parfum
  "Parfum veiw Screen": (context) => ParfumScreen(),
  "Screen Veiw Item Parfum": (context) => ScreenVeiwItemParfum(),
  "Add Parfum Screen": (context) => AddParfumScreen(),
  "Gallery Images Parfum Screen": (context) => GalleryImagesParfumScreen(),

  //MakeUp
  "MakeUp veiw Screen": (context) => MakeUpScreen(),
  "Screen Veiw Item MakeUp": (context) => ScreenVeiwItemMakeUp(),
  "Add MakeUp Screen": (context) => AddMakeUpScreen(),
  "Gallery Images MakeUp Screen": (context) => GalleryImagesMakeUpScreen(),

  //Autres
  "Autres veiw Screen": (context) => AutresScreen(),
  "Screen Veiw Item Autres": (context) => ScreenVeiwItemAutres(),
  "Add Autres Screen": (context) => AddAutresScreen(),
  "Gallery Images Autres Screen": (context) => GalleryImagesAutresScreen(),

  "New Order Screen": (context) => NewOrderScreen(),
  "Chosing Product Screen": (context) => ChosingProductScreen(),
  "Succes Order Screen": (context) => SuccesOrder(),
  "MyHomePage": (context) => MyHomePage(),
  "chart screen": (context) => chart(),
  "print": (context) => Printers(),
  //"Screen Parfum v eiw": (context) => GalleryImagesScreen(),
  //Maquillage

  //Autres
  //
};
