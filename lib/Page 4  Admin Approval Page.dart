import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel Admin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
      ),
      home: const AdminApprovalPage(),
    );
  }
}

class AdminApprovalPage extends StatelessWidget {
  const AdminApprovalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotel Approval'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Add logout functionality here
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Decision on Request?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _showConfirmationDialog(context, true),
                      child: const Text("Approve"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _showConfirmationDialog(context, false),
                      child: const Text("Reject"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(height: 32),
              _buildHotelInfoSection(),
              const SizedBox(height: 16),
              _buildPhotosSection(),
            ],
          ),
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context, bool isApprove) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isApprove ? "Approve Hotel?" : "Reject Hotel?"),
        content: Text(
          isApprove
              ? "Are you sure you want to approve this hotel listing?"
              : "Are you sure you want to reject this hotel listing?",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isApprove
                        ? "Hotel approved successfully"
                        : "Hotel rejected",
                  ),
                  backgroundColor:
                      isApprove ? Colors.green : Colors.red,
                ),
              );
            },
            child: Text(isApprove ? "Approve" : "Reject"),
          ),
        ],
      ),
    );
  }

  Widget _buildHotelInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InfoLine("Hotel ID", "H000001COL"),
        InfoLine("Hotel Name", "Western Valley Holiday Resort"),
        InfoLine("Star Rating", "4 Star"),
        InfoLine("District", "Galle"),
        InfoLine("Address", "122/7, Hikkaduwa"),
        InfoLine("Contact", "+947770679679"),
        InfoLine("Email", "westvalleylpc@gmail.com"),
        InfoLine(
          "Description",
          "Experience luxury and comfort at Western Valley Holiday Resort. Our resort offers premium amenities and exceptional service.",
        ),
        InfoLine(
          "Facilities",
          "Accommodation, Food & Beverages, Swimming Pool, Free WiFi, Parking",
        ),
      ],
    );
  }

  Widget _buildPhotosSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Photos",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: List.generate(
            6,
            (index) => GestureDetector(
              onTap: () => _showFullPhoto(context, index),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.photo, size: 30, color: Colors.grey),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showFullPhoto(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            image: const DecorationImage(
              image: AssetImage('assets/placeholder_hotel.jpg'), // Add your image
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                child: Text(
                  "Photo ${index + 1}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoLine extends StatelessWidget {
  final String title;
  final String value;

  const InfoLine(this.title, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black, fontSize: 14),
          children: [
            TextSpan(
              text: "$title: ",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}