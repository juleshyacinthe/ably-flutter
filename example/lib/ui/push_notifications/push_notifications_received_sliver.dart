import 'dart:io';

import 'package:ably_flutter/ably_flutter.dart' as ably;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../push_notifications/push_notification_handlers.dart';
import '../text_row.dart';

class PushNotificationsReceivedSliver extends StatelessWidget {
  const PushNotificationsReceivedSliver();

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Received messages',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: PushNotificationHandlers.clearReceivedMessages,
                    icon: Icon(Icons.delete))
              ],
            ),
            StreamBuilder<List<ably.RemoteMessage>>(
                stream: PushNotificationHandlers.receivedMessagesStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text('Widget not loaded yet.');
                  }
                  final messages = snapshot.data;
                  if (messages!.isEmpty) {
                    return const Text('No messages yet');
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: messages
                          .map((e) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextRow('Notification Title',
                                        e.notification?.title ?? 'NO TITLE'),
                                    TextRow('Notification Body',
                                        e.notification?.body ?? 'NO BODY'),
                                    TextRow('Data', e.data.toString()),
                                  ],
                                ),
                              ))
                          .toList(),
                    );
                  }
                }),
          ],
        ),
      );
}
