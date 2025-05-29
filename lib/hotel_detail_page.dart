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
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Colors.black26),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: const [
                _infoRow("Hotel ID", "#H000001COL"),
                _infoRow("Name", "Western Valley Holiday Resort Corporation PLC"),
                _infoRow("Location", "122/7, Hikkaduwa, Galle"),
                _infoRow("Phone", "+94 777 067 967"),
                _infoRow("Email", "westvalleyplc@gmail.com"),
                _infoRow("Registered Date", "2024-01-12"),
                _infoRow("Rooms", "32"),
                _infoRow("Status", "Verified"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _infoRow extends StatelessWidget {
  final String label;
  final String value;

  const _infoRow(this.label, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Text(
                "$label:",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 14),
              )),
          Expanded(
              flex: 5,
              child: Text(
                value,
                style: const TextStyle(fontSize: 14),
              )),
        ],
      ),
    );
  }
}
