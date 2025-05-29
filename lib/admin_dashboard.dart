import 'package:flutter/material.dart';
import 'hotel_detail_page.dart';
import 'user_detail_page.dart';
import 'pending_requests_page.dart';
import 'reported_incidents_page.dart'; // <-- Add this file in your project

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: const Text('Administrator Dashboard'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[100],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Summary Cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _infoCard("Total Users", "2210"),
                _infoCard("Registered Hotels", "112"),
                _actionCard("Pending Requests", context),
                _actionCard("Reported Incidents", context),
              ],
            ),
            const SizedBox(height: 20),
            // Search Bar
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "#H000001COL",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  label: const Text("Go"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            // Hotel Info Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Colors.black26),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Western Valley Holiday Resort Corporation PLC",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 5),
                    const Text("Galle / 122/7, Hikkaduwa"),
                    const Text("+947770679679"),
                    const Text("westvalleyplc@gmail.com"),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const HotelDetailPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        child: const Text("VIEW Account"),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // User Detail Button
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UserDetailPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                child: const Text("View User Details"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoCard(String title, String value) {
    return Container(
      width: 90,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 12)),
          const SizedBox(height: 5),
          Text(value,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white)),
        ],
      ),
    );
  }

  Widget _actionCard(String title, BuildContext context) {
    return Container(
      width: 90,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 12)),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {
              if (title == "Pending Requests") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PendingRequestsPage()),
                );
              } else if (title == "Reported Incidents") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ReportedIncidentsPage()),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: title == "Reported Incidents" ? Colors.yellow : Colors.white,
              foregroundColor: Colors.lightBlue,
              padding: const EdgeInsets.symmetric(horizontal: 10),
            ),
            child: const Text("View"),
          ),
        ],
      ),
    );
  }
}
