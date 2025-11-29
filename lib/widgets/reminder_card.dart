import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/reminder_item.dart';

class ReminderCard extends StatelessWidget {
  final ReminderItem item;
  final bool isDarkMode;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ReminderCard({
    super.key,
    required this.item,
    required this.isDarkMode,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormat('MMM d').format(item.date);
    final timeStr = item.time.format(context);

    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: item.color,
          child: Icon(item.icon, color: Colors.white),
        ),
        title: Text(item.title),
        subtitle: Text("$dateStr • $timeStr"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: onEdit, icon: Icon(Icons.edit)),
            IconButton(
              onPressed: onDelete,
              icon: Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
