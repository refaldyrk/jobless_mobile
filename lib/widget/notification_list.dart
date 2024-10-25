import 'package:flutter/material.dart';
import 'package:jobless/styles.dart';
import 'package:jobless/model/notification.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class NotificationListCard extends StatelessWidget {
  final NotificationsModel notif;

  const NotificationListCard({
        super.key,
        required this.notif
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Card(
          color: primaryColor,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 1,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  child: Image.asset(notif.image),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Application sent',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        notif.description,
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            notif.date,
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Text(
                            'Delete',
                            style: TextStyle(fontSize: 12, color: Colors.red),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}