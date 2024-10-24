import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jobless/page/job_list.dart';

import '../styles.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 final TextEditingController usernameCtrl = TextEditingController();
 final TextEditingController passwordCtrl = TextEditingController();


 final dio = Dio();

  get colorSearchBg => null;

  void login() async {
    var data = json.encode({
      "username": usernameCtrl.text,
      "password": passwordCtrl.text
    });
    var dio = Dio();
    String url = const String.fromEnvironment("BASE_API");
    var response = await dio.request(
      '$url/api/login',
      options: Options(
        method: 'POST',
      ),
      data: data,
    );
    
    print(response);

    if (response.statusCode == 200) {
      print(json.encode(response.data));
      Navigator.pushReplacementNamed(context, JobListPage.routeName);
    }
    else {
      print(response.statusMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 27.81),
            Image.asset('assets/images/logo.png'),
            const SizedBox(height: 34.1),
            const Text('Welcome Back!', style: TextStyle(fontSize: 32.09, fontWeight: FontWeight.bold)),
            const SizedBox(height: 56.63),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              child: TextField(
                controller: usernameCtrl,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.1)),
                    hintText: 'Email'),
              ),
            ),
            const SizedBox(height: 21.4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              child: TextField(
                controller: passwordCtrl,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.1)),
                    hintText: 'Password',
                ),
              ),
            ),
            const SizedBox(height: 16.5),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Forgot password', style: TextStyle(fontSize: 17.1))
                ],
              ),
            ),
            const SizedBox(height: 53.81),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 21.4),
              width: double.infinity,
              height: 74.88,
              child: TextButton(
                onPressed: login,
                style: TextButton.styleFrom(
                  backgroundColor: secondaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.7))
                ),
                child: const Text('Login', style: TextStyle(fontSize: 20)),
              ),
            ),
            const SizedBox(height: 53.94),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: MediaQuery.sizeOf(context).width * 0.4, child: const Divider()),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text('or'),
                ),
                SizedBox(width: MediaQuery.sizeOf(context).width * 0.4, child: const Divider()),
              ],
            ),
            const SizedBox(height: 53.09),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 21.4),
                  width: 64,
                  height: 64,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                        side: const BorderSide(width: 1.6),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.7))
                    ),
                    child: Image.asset('assets/images/fb.png', fit: BoxFit.cover),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 21.4),
                  width: 64,
                  height: 64,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(16),
                        side: const BorderSide(width: 1.6),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.7))
                    ),
                    child: Image.asset('assets/images/google.png', fit: BoxFit.cover),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 21.4),
                  width: 64,
                  height: 64,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(16),
                        side: const BorderSide(width: 1.6),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.7))
                    ),
                    child: Image.asset('assets/images/apple.png', fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            RichText(text: const TextSpan(
              style: TextStyle(color: Colors.black, fontSize: 15.6),
              children: [
                TextSpan(
                 text: "Don't have an account? ",

                ),
                TextSpan(
                  text: 'Sign up',
                  style: TextStyle(fontWeight: FontWeight.bold)
                )
              ]
            )),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}