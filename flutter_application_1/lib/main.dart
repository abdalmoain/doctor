import 'package:flutter/material.dart';
import 'package:flutter_application_1/AUTH/Login.dart';
import 'package:flutter_application_1/AUTH/SignUp_PATIENT.dart';
import 'package:flutter_application_1/AUTH/signUp_STUDENT.dart';
import 'package:flutter_application_1/HOME_PAGE/Search_bar.dart';
import 'package:flutter_application_1/HOME_PAGE/homepage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'HOME_PAGE/Choose Preview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
   locale: Locale('ar'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar'), // العربية
        Locale('en'), // الإنجليزية
      ],
   home: RoleSelectionScreen(),
   routes:{  '/SignUp': (context) => SignUp(),
   '/Login': (context) => Login(),
   '/Search_bar':(context)=>Search_bar(),
   '/Homepage':(context)=>Homepage(),
   '/previeww':(context)=>previeww(),
    } 
  
     
    );
  }
}

