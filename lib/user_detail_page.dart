import 'package:flutter/material.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Details"),
        backgroundColor: Colors.lightBlue[100],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Name: John Doe", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Email: john@example.com", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Phone: +94771234567", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Status: Active", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
