import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobless/model/job.dart';
import 'package:jobless/styles.dart';
import 'package:jobless/widget/joblist_card.dart';

class JobListPage extends StatefulWidget {
  static const routeName = '/joblist';

  const JobListPage({super.key});

  @override
  State<JobListPage> createState() => _JobListPageState();
}

class _JobListPageState extends State<JobListPage> {
  final TextEditingController searchCtrl = TextEditingController();
  int _selectedIndex = 0;
  List<Job> jobList = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedIndex = 0;
    });
    getJobs();
  }

  Future<void> getJobs() async {
    final String response = await rootBundle.loadString('assets/job.json');
    final data = await json.decode(response);
    setState(() {
      jobList = List<Job>.from(data.map((model)=> Job.fromJson(model)));
    });
  }

  Future<void> searchJobs() async {
    final String response = await rootBundle.loadString('assets/job.json');
    final data = await json.decode(response);

    setState(() {
      if (searchCtrl.text.isEmpty) {
        jobList = List<Job>.from(data.map((model) => Job.fromJson(model)));
      } else {
        jobList = List<Job>.from(data.map((model) => Job.fromJson(model))).where((job) {
          return job.title.toLowerCase().contains(searchCtrl.text.toLowerCase()) ||
              job.company.toLowerCase().contains(searchCtrl.text.toLowerCase());
        }).toList();
      }
    });
  }

  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.pushNamed(context, '/notifications');
      _selectedIndex = 0;
    }

    if (index == 0) {
      getJobs();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(backgroundColor: secondaryColor, foregroundColor: primaryColor, title:  const Padding(padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
        child: Text('JOBLESS', style: TextStyle(fontWeight: FontWeight.bold)),
      ),),
      bottomNavigationBar: NavigationBar(
        backgroundColor: primaryColor,
        indicatorColor: secondaryColor,
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onDestinationSelected,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home, color: primaryColor),
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            label: 'Notifications',
            selectedIcon: Icon(Icons.notifications, color: primaryColor,),
            icon: Stack(children: <Widget>[
              Icon(Icons.notifications),
              Positioned(
                // draw a red marble
                top: 0.0,
                right: 0.0,
                child: Icon(Icons.brightness_1, size: 8.0, color: Colors.red),
              )
            ]),
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.supervised_user_circle, color: primaryColor,),
            icon:Icon(Icons.supervised_user_circle),
            label: 'Profile',
          ),
        ],
      ),
      body:  Stack(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: 250,
            decoration: const BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50)
              )
            ),
          ),
          Column(
            children: [
              RichText(textAlign: TextAlign.center, text: const TextSpan(
                style: TextStyle(fontSize: 20),
                children: [
                  TextSpan(text: 'Jobless ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: 'is the '),
                  TextSpan(text: '#1 ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: 'destination to find and list incredible remote jobs')
                ],
              )),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                child: TextField(
                 controller: searchCtrl,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Search jobs',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    suffixIcon: Container(
                      margin: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: secondaryColor,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.search, color: primaryColor),
                        onPressed: () {
                          searchJobs();
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                  child: RefreshIndicator(
                    onRefresh: () {
                      return getJobs();
                    },
                    child: ListView.builder(itemCount: jobList.length,itemBuilder: (context, index) {
                      final Job job = jobList[index];
                      return JobListCard(job: job);
                    }),
                  ),
                ),
              ),
            ],
          ),
        ]
      )
    );
  }
}

