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
   List<Job> jobList = [];
  @override
  void initState() {
    super.initState();
    getJobs();
  }

  Future<void> getJobs() async {
    final String response = await rootBundle.loadString('assets/job.json');
    final data = await json.decode(response);
    setState(() {
      jobList = List<Job>.from(data.map((model)=> Job.fromJson(model)));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(backgroundColor: secondaryColor, foregroundColor: primaryColor, title:  const Padding(padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
        child: Text('JOBLESS', style: TextStyle(fontWeight: FontWeight.bold)),
      ),),
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
                          // Logika pencarian.
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

