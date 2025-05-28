import 'package:flutter/material.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD7F1FD), // Light blue background
      appBar: AppBar(
        title: const Text("User Details"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 60,
              child: Icon(Icons.person, size: 60),
            ),
            const SizedBox(height: 16),
            const Text(
              "Alan Robbert Monaco",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text("Scotland"),
            const SizedBox(height: 20),
            const UserDetailRow(label: "First Name:", value: "Alan Robbert"),
            const UserDetailRow(label: "Last Name:", value: "Monaco"),
            const UserDetailRow(label: "Country:", value: "Scotland"),
            const UserDetailRow(label: "NIC / Passport ID:", value: "20787763254578"),
            const UserDetailRow(label: "Phone Number:", value: "+2096434354376"),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                  onPressed: () {
                    // Add your warning logic here
                  },
                  child: const Text("Send Warning", style: TextStyle(color: Colors.black)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    // Add your ban logic here
                  },
                  child: const Text("BAN Account", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class UserDetailRow extends StatelessWidget {
  final String label;
  final String value;

  const UserDetailRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(flex: 3, child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold))),
          Expanded(flex: 5, child: Text(value)),
        ],
      ),
    );
  }
}
