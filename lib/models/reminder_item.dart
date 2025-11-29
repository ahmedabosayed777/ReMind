class ReminderItem {
  final int id;
  final String title;
  final DateTime date;
  final String time; // store time as a string like "08:30"
  final int color; // store color as ARGB integer, e.g. 0xFF4285F4
  final String icon; // store icon name or asset path

  ReminderItem({
    required this.id,
    required this.title,
    required this.date,
    required this.time,
    required this.color,
    required this.icon,
  });
}
