import 'package:flutter/material.dart';

void main() {
  runApp(EditProfileApp());
}

class EditProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EditProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class EditProfilePage extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController passportController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

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
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'User Dashboard',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                dashboardButton(Icons.emoji_emotions, "Profile", false),
                dashboardButton(Icons.edit, "Edit Profile Details", true),
                dashboardButton(Icons.star_border, "Wishlist", false),
                dashboardButton(Icons.report_problem_outlined, "Report a Problem", false),
              ],
            ),
            SizedBox(height: 20),
            buildInputField("First Name", firstNameController),
            buildInputField("Last Name", lastNameController),
            buildInputField("Country", countryController),
            buildInputField("NIC/Passport ID", passportController),
            buildInputField("Phone Number", phoneController),
            SizedBox(height: 20),
            Stack(
              alignment: Alignment.topRight,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, size: 50, color: Colors.black),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.delete, color: Colors.red),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {},
                  child: Text("Cancel", style: TextStyle(color: Colors.black)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {},
                  child: Text("Save Changes", style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
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

  Widget buildInputField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: UnderlineInputBorder(),
        ),
      ),
    );
  }
}
