import 'package:flutter/material.dart';

void main() {
  runApp(WishlistApp());
}

class WishlistApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WishlistPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WishlistPage extends StatefulWidget {
  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  List<String> wishlist = [
    'Western Valley Holiday Resort Corporation',
    'Ocean View Surfing - Luxury Accommodation',
    'Eastern Paradise Hotels',
    'Luxe Villa Grand',
  ];

  void removeItem(int index) {
    setState(() {
      wishlist.removeAt(index);
    });
  }

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
      body: Padding(
        padding: const EdgeInsets.all(8),
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
                dashboardButton(Icons.emoji_emotions, "Profile", false),
                dashboardButton(Icons.edit, "Edit Profile Details", false),
                dashboardButton(Icons.star, "Wishlist", true),
                dashboardButton(Icons.report_problem_outlined, "Report a Problem", false),
              ],
            ),
            SizedBox(height: 20),
            Divider(thickness: 1),
            Expanded(
              child: ListView.builder(
                itemCount: wishlist.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      title: Text(
                        wishlist[index],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => removeItem(index),
                      ),
                    ),
                  );
                },
              ),
            ),
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
}
