class Job {
  final String title;
  final String company;
  final String location;
  final String date;

  Job({
    required this.title,
    required this.company,
    required this.location,
    required this.date,
  });

  Job.fromJson(Map<String, dynamic> json):
        title = json['title'] as String,
        company = json['company'] as String,
        location = json['location'] as String,
        date = json['date'] as String;

}

