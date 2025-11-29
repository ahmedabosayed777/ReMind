import "package:flutter/material.dart";
import '../models/reminder_item.dart';
import '../widgets/reminder_card.dart';
import '../widgets/add_edit_sheet.dart';

run test1class ReminderPage extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  const ReminderPage({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
  });

  @override
  State<ReminderPage> createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  List<ReminderItem> reminders = [];

  final List<IconData> availableIcons = [
    Icons.calendar_month,
    Icons.shopping_cart,
    Icons.shopping_bag,
    Icons.volunteer_activism,
    Icons.book,
  ];

  List<Color> get availableColors => [
    Color(0xfff97316),
    Color(0xffeab308),
    Color(0xff22c55e),
    Color(0xff06b6d4),
    Color(0xff3b82f6),
    Color(0xffa855f7),
    Color(0xffec4899),
  ];

  void _addOrEditReminder({ReminderItem? existingItem}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddEditSheet(
        existingItem: existingItem,
        availableIcons: availableIcons,
        availableColors: availableColors,
        onSave: (newItem) {
          setState(() {
            if (existingItem != null) {
              int index = reminders.indexWhere((r) => r.id == existingItem.id);
              if (index != -1) reminders[index] = newItem;
            } else {
              reminders.add(newItem);
            }
          });
          Navigator.pop(context);
        },
        onDelete: existingItem != null
            ? () => _confirmDelete(existingItem)
            : null,
      ),
    );
  }

  void _confirmDelete(ReminderItem item) {
    if (Navigator.canPop(context)) Navigator.pop(context);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Delete Reminder?"),
        content: Text("Are you sure?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() => reminders.removeWhere((r) => r.id == item.id));
              Navigator.pop(context);
            },
            child: Text("Delete"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reminders"),
        actions: [
          IconButton(
            onPressed: widget.toggleTheme,
            icon: Icon(widget.isDarkMode ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),
      body: reminders.isEmpty
          ? Center(child: Text("No reminders yet"))
          : ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: reminders.length,
              itemBuilder: (c, i) {
                final item = reminders[i];
                return ReminderCard(
                  item: item,
                  isDarkMode: widget.isDarkMode,
                  onEdit: () => _addOrEditReminder(existingItem: item),
                  onDelete: () => _confirmDelete(item),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addOrEditReminder(),
        child: Icon(Icons.add),
      ),
    );
  }
}
