import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import 'package:nammamadurai/home.dart';
import 'package:nammamadurai/signin.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:nammamadurai/splashscreen.dart';
import 'firebase_options.dart';


Future<void> main() async {




// ...
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(

    debugShowCheckedModeBanner: false,
    home: mainpage(),
  ));
}
class mainpage extends StatefulWidget {
  const mainpage({super.key});

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  @override
  Widget build(BuildContext context) {


    return splashscreen();

  }
}
