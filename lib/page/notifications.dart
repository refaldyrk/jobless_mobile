import 'package:flutter/material.dart';
import 'package:jobless/styles.dart';
import 'package:jobless/model/notification.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:jobless/widget/notification_list.dart';

class NotificationsPage extends StatefulWidget {
  static const routeName = '/notifications';
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPage();
}

class _NotificationsPage extends State<NotificationsPage> {
  int _selectedIndex = 0;
  List<NotificationsModel> notifList = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedIndex = 0;
    });
    getNotif();
  }

  Future<void> getNotif() async {
    final String response = await rootBundle.loadString('assets/notification.json');
    final data = await json.decode(response);
    setState(() {
      notifList = List<NotificationsModel>.from(data.map((model)=> NotificationsModel.fromJson(model)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 35, horizontal: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: Icon(Icons.arrow_back),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: secondaryColor,
                    shape: CircleBorder(),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Read all',
                    style: TextStyle(color: secondaryColor),
                  ),
                )
              ],
            ),
          ),
          Center(
            child: Text(
              'Notifications',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: Padding(padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: RefreshIndicator(
                onRefresh: () {
                  return getNotif();
                },
                child: ListView.builder(itemCount: notifList.length,itemBuilder: (context, index) {
                  final NotificationsModel notif = notifList[index];
                  return NotificationListCard(notif: notif);
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}