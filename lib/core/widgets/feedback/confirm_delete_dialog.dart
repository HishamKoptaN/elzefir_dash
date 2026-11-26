import 'package:flutter/material.dart';

/// نافذة تأكيد موحّدة قبل حذف أي عنصر من الداشبورد.
Future<bool> confirmDelete(BuildContext context, String name) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('تأكيد الحذف'),
        content: Text('هل تريد حذف «$name»؟ لا يمكن التراجع عن ذلك.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: const Text('إلغاء'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text('حذف'),
          ),
        ],
      );
    },
  );
  return result ?? false;
}
