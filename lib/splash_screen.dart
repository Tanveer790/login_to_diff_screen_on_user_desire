import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rest_api/home_screen.dart';
import 'package:rest_api/login_screen.dart';
import 'package:rest_api/student_view.dart';
import 'package:rest_api/teacher_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();

  }

  void isLogin ()async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    bool isLogin = sp.getBool('isLogin') ?? false;
    String selectVal = sp.getString('userType') ?? '';

    if (isLogin) {
      if (selectVal == 'student') {
        Timer(const Duration(seconds: 3), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const StudentView()));
        });
      } else if (selectVal == 'teacher') {
        Timer(const Duration(seconds: 3), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const TeacherView()));
        });
      } else {
        Timer(const Duration(seconds: 3), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AdminScreen()));
        });
      }
      } else {
      Timer(const Duration(seconds: 3), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Image(image: NetworkImage('https://media.istockphoto.com/id/1328989522/photo/empty-screen-laptop-with-liquid-paint-splash-on-black-background.jpg?s=1024x1024&w=is&k=20&c=VxmxNX7qNOuCj_cpqzVuYTxyXum0P8-EsHi7ACbxSMY=')),
    );
  }
}
