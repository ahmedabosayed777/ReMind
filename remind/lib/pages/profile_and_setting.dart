import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // State variables for toggles
  bool _notificationsEnabled = true;
  bool _categoriesTagsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Set AppBar to null or use a custom leading widget for a custom back arrow
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            // Handle back button press - In a real app, this would likely be Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // --- Profile Header Section ---
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    // Replace with actual image asset or network image
                    backgroundImage: NetworkImage('https://i.imgur.com/8xYtXJp.png'),
                    backgroundColor: Colors.grey,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Name',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Personal email',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // --- Notifications Setting ---
            _buildToggleSetting(
              title: 'Notifications',
              value: _notificationsEnabled,
              onChanged: (bool newValue) {
                setState(() {
                  _notificationsEnabled = newValue;
                });
              },
            ),
            const SizedBox(height: 25),

            // --- Location Services ---
            const Text(
              'Location Services',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.orange, size: 20),
                const SizedBox(width: 8),
                Text(
                  'High Accuracy',
                  style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // --- Connected Devices ---
            const Text(
              'Connected Devices',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 10),
            _buildDeviceRow(
              icon: Icons.wifi,
              label: 'Home Wifi',
              color: Colors.blue.shade700,
            ),
            const SizedBox(height: 10),
            _buildDeviceRow(
              icon: Icons.bluetooth,
              label: 'Car Bluetooth',
              color: Colors.blue.shade700,
            ),
            const SizedBox(height: 30),

            // --- Categories & Tags ---
            const Text(
              'Categories & Tags',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                _buildTag('Tags', Colors.orange),
                const SizedBox(width: 8),
                _buildTag('Tags', Colors.green),
                const SizedBox(width: 8),
                _buildTag('Tags', Colors.grey),
                const Spacer(),
                Switch(
                  value: _categoriesTagsEnabled,
                  onChanged: (bool newValue) {
                    setState(() {
                      _categoriesTagsEnabled = newValue;
                    });
                  },
                  activeThumbColor: Colors.blue,
                ),
              ],
            ),
            const SizedBox(height: 30),

            // --- Backup & Sync ---
            _buildIconSetting(
              title: 'Backup & Sync',
              icon: Icons.cloud_upload,
              iconColor: Colors.blue,
            ),
            const SizedBox(height: 25),

            // --- Help & Support ---
            _buildTextSetting(
              title: 'Help & Support',
            ),
            const SizedBox(height: 50),

            // --- Logout Button ---
            Center(
              child: Container(
                width: double.infinity,
                height: 60,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  // Gradient color similar to the screenshot
                  gradient: LinearGradient(
                    colors: [
                      Colors.pink.shade300,
                      Colors.pink.shade200,
                      Colors.red.shade200
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    // Handle logout
                  },
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Helper Widgets ---

  // For settings with a right-aligned toggle switch
  Widget _buildToggleSetting({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeThumbColor: Colors.blue,
        ),
      ],
    );
  }

  // For settings like Backup & Sync with a right-aligned icon
  Widget _buildIconSetting({
    required String title,
    required IconData icon,
    required Color iconColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        ),
        Icon(icon, color: iconColor),
      ],
    );
  }

  // For simple text settings like Help & Support
  Widget _buildTextSetting({required String title}) {
    return Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
    );
  }

  // For Connected Devices rows
  Widget _buildDeviceRow({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(fontSize: 16, color: Colors.grey[800]),
        ),
      ],
    );
  }

  // For the colorful Tags
  Widget _buildTag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2), // Light background
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}