import 'package:flutter/material.dart';
import 'package:jobless/model/job.dart';
import 'package:jobless/styles.dart';
import 'package:jobless/page/job_list.dart';

class JobDetailsPage extends StatefulWidget {
  static const routeName = '/job_details';
  final Job job;
  const JobDetailsPage({required this.job, super.key});

  @override
  State<JobDetailsPage> createState() => _JobDetailsPage();
}

class _JobDetailsPage extends State<JobDetailsPage> {
  late Job job;
  late bool readMore = false;

  void initState() {
    super.initState();
    setState(() {
      job = widget.job;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 50,
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(secondaryColor),

      ),
          child: const Center(
            child: Text('Apply Now'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 134),
              height: 150,
              width: MediaQuery.sizeOf(context).width,
              color: greyCont,
            ),
            Container(
              height: 150,
              width: MediaQuery.sizeOf(context).width,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 100),
              child: Center(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset('assets/images/google.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Text(job.title, style: TextStyle(fontWeight: FontWeight.w700),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          job.company,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            '•',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                        Text(
                          job.location,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            '•',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                        Text(
                          job.date,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 300),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Job Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                    maxLines: readMore ? null : 5,
                    overflow: readMore ? TextOverflow.visible : TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          readMore = !readMore;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: secondaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(!readMore ? 'Read more' : 'Read less'),
                    ),
                  ),

                  SizedBox(height: 25),
                  Text(
                    'Requirements',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 15),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '•',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'Sed ut perspiciatis unde omnis iste natus error sit.',
                              style: TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '•',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'Sed ut perspiciatis unde omnis iste natus error sit.',
                              style: TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '•',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'Sed ut perspiciatis unde omnis iste natus error sit.',
                              style: TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '•',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'Sed ut perspiciatis unde omnis iste natus error sit.',
                              style: TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              )
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Icon(Icons.arrow_back),
                style: ElevatedButton.styleFrom(
                  backgroundColor: secondaryColor,
                  shape: CircleBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}