import 'dart:async';

import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:registration_app2/ui/registration_add.dart';

class SplashScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _SplashScreen();

}

class _SplashScreen extends State<SplashScreen>{


  @override
  Widget build(BuildContext context) {

    return EasySplashScreen(
      logo: Image.network(
          'https://www.pngmart.com/files/7/Blood-Donation-PNG-Free-Download.png'),
      title: Text(
        "Registration App",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      showLoader: true,
      loadingText: Text("Loading..."),
      navigator: RegistrationAdd(),
      durationInSeconds: 3,
    );
  }



}

