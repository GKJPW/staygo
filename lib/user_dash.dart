import 'package:flutter/material.dart';

void main() {
  runApp(StayGoApp());
}

class StayGoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserDashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class UserDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[200],
        leading: Icon(Icons.arrow_back),
        title: Text("Alan Robbert"),
        centerTitle: true,
        actions: [
          Icon(Icons.notifications_none),
          SizedBox(width: 10),
          Icon(Icons.sync),
          SizedBox(width: 10),
        ],
      ),
      
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              'User Dashboard',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                dashboardButton(Icons.emoji_emotions, "Profile", true),
                dashboardButton(Icons.edit, "Edit Profile Details", false),
                dashboardButton(Icons.star_border, "Wishlist", false),
                dashboardButton(Icons.report_problem_outlined, "Report a Problem", false),
              ],
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 10),
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, size: 50, color: Colors.black),
            ),
            SizedBox(height: 10),
            Text('#U000009190', style: TextStyle(color: Colors.grey[700])),
            SizedBox(height: 10),
            Text(
              'Alan Robbert\nMonaco',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5),
            Text('Scotland'),
            SizedBox(height: 20),
            infoRow("First Name:", "Alan Robbert"),
            infoRow("Last Name:", "Monaco"),
            infoRow("Country:", "Scotland"),
            infoRow("NIC / Passport ID :", "20787763254578"),
            infoRow("Phone Number:", "+2096434354376"),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget dashboardButton(IconData icon, String label, bool isActive) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: isActive ? Colors.yellow[100] : Colors.blue[100],
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          child: Column(
            children: [
              Icon(icon, size: 28),
              SizedBox(height: 5),
              SizedBox(
                width: 70,
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      child: Row(
        children: [
          Expanded(flex: 3, child: Text(title, style: TextStyle(fontWeight: FontWeight.w500))),
          Expanded(flex: 5, child: Text(value)),
        ],
      ),
    );
  }
}