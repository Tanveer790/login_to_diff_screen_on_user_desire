import 'package:flutter/material.dart';
import 'package:rest_api/colors/colors_component.dart';
import 'package:rest_api/home_screen.dart';
import 'package:rest_api/student_view.dart';
import 'package:rest_api/teacher_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
//  Function(){
//    selectVal = selectValList[0];
// }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();

  final selectValList = ["student", "teacher", "admin"];
  String selectVal = "student";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: redColor,
            title: const Center(child: Text('Sign up')),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: ageController,
                  decoration: const InputDecoration(
                      hintText: 'Age',
                      prefixIcon: Icon(Icons.date_range_outlined)),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: passwordController,
                  decoration: const InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon: Icon(Icons.visibility_off_outlined)),
                ),
                SizedBox(
                  height: 10,
                ),
                DropdownButton<String>(
                  value: selectVal,
                  items: selectValList.map(
                    (String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem));
                    },
                  ).toList(),
                  onChanged: (val) {
                    setState(() {
                      this.selectVal = val.toString();
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () async {
                    SharedPreferences sp = await SharedPreferences.getInstance();
                    sp.setString('email', emailController.text.toString());
                    sp.setString('age', ageController.text.toString());
                    sp.setString('userType', selectVal.toString());
                    sp.setBool('isLogin', true);

                    if (selectVal == 'student') {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => StudentView()));
                    } else if (selectVal == 'teacher') {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TeacherView()));
                    } else {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AdminScreen()));
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: redColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Log in',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
