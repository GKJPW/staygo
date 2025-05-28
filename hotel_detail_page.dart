import 'package:flutter/material.dart';

class HotelDetailPage extends StatelessWidget {
  const HotelDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: const Text('Hotel Details'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[100],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Hotel Info Header
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: Colors.black12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Hotel ID: #H000001COL", style: TextStyle(fontSize: 14)),
                    SizedBox(height: 5),
                    Text("Western Valley Holiday Resort Corporation PLC",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("Galle / 122/7, Hikkaduwa"),
                    Text("+947770679679"),
                    Text("westvalleyplc@gmail.com"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Description
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Hotel Description",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 8),
            const Text(
              "Western Valley Holiday Resort is a 4-star establishment with spacious suites, a large pool, in-house dining, and easy access to the Hikkaduwa beach. Rated highly for service and cleanliness.",
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20),
            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _roundedButton(Icons.edit, "Update", Colors.green, () {
                  // Handle update
                }),
                _roundedButton(Icons.delete, "Delete", Colors.red, () {
                  // Handle delete
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _roundedButton(IconData icon, String label, Color color, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
    );
  }
}

