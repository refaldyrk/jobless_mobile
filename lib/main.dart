import 'package:flutter/material.dart';
import 'package:jobless/model/job.dart';
import 'package:jobless/page/job_detail.dart';
import 'package:jobless/page/job_list.dart';
import 'package:jobless/page/login.dart';
import 'package:jobless/styles.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  get searchCtrl => null;

  get colorSearchBg => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Root widget
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: primaryColor,
          secondary: secondaryColor,
        ),
      ),
      initialRoute: LoginPage.routeName,
      routes: {
        LoginPage.routeName: (context) => const LoginPage(),
        JobListPage.routeName: (context) => const JobListPage(),
        JobDetailsPage.routeName: (context) {
          final job = ModalRoute.of(context)!.settings.arguments as Job;
          return JobDetailsPage(job: job);
        },
      },
    );
  }
}