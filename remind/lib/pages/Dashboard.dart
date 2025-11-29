import 'package:flutter/material.dart';
import 'counter_controller.dart';

// --- WIDGETS ---
const Color kPrimaryBlue = Color(0xff4c6ef5);
const Color kAccentBlue = Color(0xff6c8cff);
const Color kAccentPurple = Color(0xff8a5cff);
const Color kBackgroundColor = Color(0xffeef1f7);
const Color kTextSecondary = Colors.black54;
class StatCard extends StatelessWidget {
  final String value;
  final String label;
  final Color color1;
  final Color color2;

  const StatCard({
    super.key,
    required this.value,
    required this.label,
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 36,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

class ReminderTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;

  const ReminderTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.iconColor = Colors.redAccent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 24, color: iconColor),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(subtitle, style: const TextStyle(color: kTextSecondary)),
            ],
          ),
        ],
      ),
    );
  }
}

class StayTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;

  const StayTile({
    super.key,
    this.title = "Paris Getaway",
    this.subtitle = "Oct 24 - Oct 30 | Next Trip",
    this.color = kPrimaryBlue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.9),
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 14, color: Colors.white70),
              ),
            ],
          ),
          const Icon(Icons.flight_takeoff, color: Colors.white, size: 30),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback onTap;

  const BottomNavItem({
    super.key,
    required this.icon,
    required this.label,
    this.active = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: active ? kPrimaryBlue : Colors.black45, size: 28),
          Text(
            label,
            style: TextStyle(
              color: active ? kPrimaryBlue : Colors.black45,
              fontSize: 12,
              fontWeight: active ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

// --- SCREENS ---

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text("Search"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: const TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "Search tasks or contacts...",
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: kTextSecondary),
                  suffixIcon: Icon(Icons.mic, color: kTextSecondary),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Expanded(
              child: Center(
                child: Text(
                  "Search results will appear here",
                  style: TextStyle(color: kTextSecondary, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RemindersPage extends StatelessWidget {
  const RemindersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text("All Reminders"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          ReminderTile(
            icon: Icons.shopping_cart,
            title: "Buy groceries",
            subtitle: "When leaving work",
            iconColor: Color(0xFFE57373),
          ),
          ReminderTile(
            icon: Icons.call,
            title: "Call Mom",
            subtitle: "6:00 PM Today",
            iconColor: Color(0xFF64B5F6),
          ),
          ReminderTile(
            icon: Icons.water_drop,
            title: "Water plants",
            subtitle: "When connecting to home WiFi",
            iconColor: Color(0xFF81C784),
          ),
          ReminderTile(
            icon: Icons.fitness_center,
            title: "Gym Session",
            subtitle: "7:00 AM Tomorrow",
            iconColor: Color(0xFFFFB74D),
          ),
          ReminderTile(
            icon: Icons.work,
            title: "Submit Report",
            subtitle: "By Friday EOD",
            iconColor: Color(0xFF9575CD),
          ),
        ],
      ),
    );
  }
}

class StaysPage extends StatelessWidget {
  const StaysPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text("Upcoming Stays"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          StayTile(
            title: "Paris Getaway",
            subtitle: "Oct 24 - Oct 30 | Next Trip",
          ),
          StayTile(
            title: "Beach Vacation",
            subtitle: "Nov 15 - Nov 22 | Confirmed",
            color: Color(0xFF81C784),
          ),
          StayTile(
            title: "Mountain Retreat",
            subtitle: "Dec 10 - Dec 15 | Planning",
            color: Color(0xFF64B5F6),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: kPrimaryBlue,
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                const SizedBox(height: 16),
                const Text(
                  "John Doe",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  "john.doe@example.com",
                  style: TextStyle(color: kTextSecondary),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                _buildProfileOption(Icons.settings, "Settings", () {}),
                _buildProfileOption(
                  Icons.notifications,
                  "Notifications",
                  () {},
                ),
                _buildProfileOption(
                  Icons.security,
                  "Privacy & Security",
                  () {},
                ),
                _buildProfileOption(Icons.help, "Help & Support", () {}),
                _buildProfileOption(Icons.logout, "Logout", () {
                  Navigator.pop(context);
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String text, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: kPrimaryBlue),
        title: Text(text),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}

class AddItemPage extends StatelessWidget {
  const AddItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text("Add New Item"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: const Icon(Icons.assignment, color: kPrimaryBlue),
                title: const Text("Add Reminder"),
                subtitle: const Text("Create a new reminder"),
                onTap: () {
                  _showAddDialog(context, "Reminder", () {
                    counterController.addReminder();
                  });
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.hotel, color: kPrimaryBlue),
                title: const Text("Add Stay"),
                subtitle: const Text("Add a new travel plan"),
                onTap: () {
                  _showAddDialog(context, "Stay", () {});
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.task, color: kPrimaryBlue),
                title: const Text("Add Task"),
                subtitle: const Text("Create a new task"),
                onTap: () {
                  _showAddDialog(context, "Task", () {
                    counterController.addReminder();
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddDialog(BuildContext context, String type, VoidCallback onAdd) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add New $type"),
          content: Text("This would open a form to add a new $type"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                onAdd();
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("$type added successfully!"),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.pop(context); // Go back to home
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }
}

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text("Statistics Dashboard"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListenableBuilder(
        listenable: counterController,
        builder: (context, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: StatCard(
                        value: counterController.remindersToday.toString(),
                        label: "Reminders Today",
                        color1: kAccentBlue,
                        color2: kPrimaryBlue,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: StatCard(
                        value: counterController.completedThisWeek.toString(),
                        label: "Completed This Week",
                        color1: kAccentPurple,
                        color2: const Color(0xff6b3df5),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Row(
                  children: [
                    Expanded(
                      child: StatCard(
                        value: "3",
                        label: "Upcoming Stays",
                        color1: Color(0xFF81C784),
                        color2: Color(0xFF4CAF50),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: StatCard(
                        value: "85%",
                        label: "Completion Rate",
                        color1: Color(0xFFFFB74D),
                        color2: Color(0xFFFF9800),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Weekly Progress",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      LinearProgressIndicator(
                        value: 0.75,
                        backgroundColor: Colors.grey,
                        valueColor: AlwaysStoppedAnimation<Color>(kPrimaryBlue),
                        minHeight: 8,
                      ),
                      SizedBox(height: 8),
                      Text("75% of weekly goals completed"),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}