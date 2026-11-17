import 'package:flutter/material.dart';

import '../../../../domain/entities/notification_entity.dart';

Widget buildNotificationItem({
  required NotificationEntity item,
  required BuildContext context,
}) {
  return ListTile(
    title: Text(item.title),
    subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(item.body),
        if (item.type == NotificationType.newUserRegistered)
          _buildRoleActions(item),
        // TextButton(
        //   onPressed: () {
        //     // context.push('/orders/${item.targetId}');
        //   },
        //   child: Text("عرض الطلب"),
        // ),
      ],
    ),
  );
}

Widget _buildRoleActions(NotificationEntity item) {
  return Row(
    children: [
      // ElevatedButton(onPressed: () => /* send accept */, child: Text("قبول")),
      // const SizedBox(width: 8),
      // OutlinedButton(onPressed: () => /* send reject */, child: Text("رفض")),
    ],
  );
}
