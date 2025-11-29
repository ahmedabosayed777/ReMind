import 'package:flutter/material.dart';
import '../models/reminder_item.dart';

class AddEditSheet extends StatefulWidget {
  final ReminderItem? existingItem;
  final List<IconData> availableIcons;
  final List<Color> availableColors;
  final Function(ReminderItem) onSave;
  final VoidCallback? onDelete;

  const AddEditSheet({
    super.key,
    this.existingItem,
    required this.availableIcons,
    required this.availableColors,
    required this.onSave,
    this.onDelete,
  });

  @override
  State<AddEditSheet> createState() => _AddEditSheetState();
}

class _AddEditSheetState extends State<AddEditSheet> {
  late TextEditingController _titleController;
  late DateTime _date;
  late TimeOfDay _time;
  late Color _color;
  late IconData _icon;

  @override
  void initState() {
    super.initState();
    final item = widget.existingItem;
    _titleController = TextEditingController(text: item?.title ?? "");
    _date = item?.date ?? DateTime.now();
    _time = item?.time ?? TimeOfDay.now();
    _color = item?.color ?? widget.availableColors.first;
    _icon = item?.icon ?? widget.availableIcons.first;
  }

  void _save() {
    if (_titleController.text.trim().isEmpty) return;

    widget.onSave(
      ReminderItem(
        id: widget.existingItem?.id ?? DateTime.now().millisecondsSinceEpoch,
        title: _titleController.text.trim(),
        date: _date,
        time: _time,
        color: _color,
        icon: _icon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.existingItem != null ? "Edit Reminder" : "New Reminder",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: _titleController,
            decoration: InputDecoration(label: Text("Title")),
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: _save, child: Text("Save")),
          if (widget.onDelete != null)
            TextButton(
              onPressed: widget.onDelete,
              child: Text("Delete", style: TextStyle(color: Colors.red)),
            ),
        ],
      ),
    );
  }
}
