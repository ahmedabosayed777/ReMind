import 'package:flutter/material.dart';

class LocationReminderSetup extends StatefulWidget {
  const LocationReminderSetup({super.key});

  @override
  State<LocationReminderSetup> createState() => _LocationReminderSetupState();
}

class _LocationReminderSetupState extends State<LocationReminderSetup> {
  String _selectedTrigger = 'arrive'; // 'arrive' or 'leave'
  double _radius = 200.0; // Default radius in meters
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Set Location Reminder',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[50],
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for location...',
                hintStyle: TextStyle(color: Colors.grey[600]),
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
              ),
            ),
          ),

          // Map Section
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.grey[300] ?? Colors.grey),
              ),
              child: Stack(
                children: [
                  // Placeholder for Map
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.map_outlined,
                          size: 64,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Map View',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        const Text(
                          'Central Mall Location',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                  ),

                  // Location Pin and Radius Circle
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.3,
                    left: MediaQuery.of(context).size.width * 0.5 - 20,
                    child: Column(
                      children: [
                        // Radius Circle
                        Container(
                          width: _radius * 0.8,
                          height: _radius * 0.8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFF6366F1).withOpacity(0.3),
                              width: 2,
                            ),
                            color: const Color(0xFF6366F1).withOpacity(0.1),
                          ),
                        ),
                        // Location Pin
                        const Icon(
                          Icons.location_pin,
                          color: Color(0xFF6366F1),
                          size: 40,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Controls Section
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Trigger Type Selection
                const Text(
                  'Trigger When:',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _buildTriggerButton(
                        text: 'When I arrive at',
                        isSelected: _selectedTrigger == 'arrive',
                        onTap: () {
                          setState(() {
                            _selectedTrigger = 'arrive';
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildTriggerButton(
                        text: 'When I leave',
                        isSelected: _selectedTrigger == 'leave',
                        onTap: () {
                          setState(() {
                            _selectedTrigger = 'leave';
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Location Name
                const Text(
                  'Location:',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[300] ?? Colors.grey),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Color(0xFF6366F1),
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Central Mall',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Radius Slider
                Text(
                  'Radius: ${_radius.round()}m',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Slider(
                  value: _radius,
                  min: 100,
                  max: 1000,
                  divisions: 9,
                  onChanged: (value) {
                    setState(() {
                      _radius = value;
                    });
                  },
                  activeColor: const Color(0xFF6366F1),
                  inactiveColor: Colors.grey[300],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      '100m',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    Text(
                      '1000m',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Preview Text
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6366F1).withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFF6366F1).withOpacity(0.2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Reminder Preview:',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Color(0xFF6366F1),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Remind: Return library books when ${_selectedTrigger == 'arrive' ? 'arriving at' : 'leaving'} Central Mall',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          side: BorderSide(color: Colors.grey[300]!),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Save the reminder and navigate back
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6366F1),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Save Reminder',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTriggerButton({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF6366F1).withOpacity(0.1)
              : Colors.grey[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFF6366F1) : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? const Color(0xFF6366F1) : Colors.grey[400],
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: isSelected ? const Color(0xFF6366F1) : Colors.black87,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
