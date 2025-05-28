import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const StayGoApp());
}

class StayGoApp extends StatelessWidget {
  const StayGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StayGo Hotel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HotelDashboardPage(),
      routes: {
        '/booking-requests': (context) => const BookingRequestsPage(),
      },
    );
  }
}

PreferredSizeWidget buildStayGoAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: const Color.fromARGB(255, 160, 220, 235),
    title: Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        Expanded(
          child: Center(
            child: Text(
              'StayGo',
              style: GoogleFonts.teko(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {},
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: OutlinedButton(
            onPressed: () {},
            child: const Text('Register/Login'),
          ),
        ),
      ],
    ),
  );
}

class HotelDashboardPage extends StatelessWidget {
  const HotelDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildStayGoAppBar(context),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/booking-requests');
          },
          child: const Text('View Booking Requests'),
        ),
      ),
    );
  }
}

class BookingRequestsPage extends StatelessWidget {
  const BookingRequestsPage({super.key});

  Widget bookingCard(String name, String roomType, String phone1, String phone2, 
                     String country, String code) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    roomType,
                    style: TextStyle(
                      color: Colors.blue[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(phone1),
                  if (phone2.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(phone2),
                  ],
                  const SizedBox(height: 4),
                  Text(
                    country,
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    code,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () => _showConfirmationDialog(context, true),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                      child: const Text("Accept"),
                    ),
                    const SizedBox(width: 8),
                    OutlinedButton(
                      onPressed: () => _showConfirmationDialog(context, false),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.red),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                      child: const Text(
                        "Reject",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context, bool isAccept) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isAccept ? "Accept Booking?" : "Reject Booking?"),
        content: Text(
          isAccept
              ? "Are you sure you want to accept this booking request?"
              : "Are you sure you want to reject this booking request?",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isAccept
                        ? "Booking accepted successfully"
                        : "Booking rejected",
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: isAccept ? Colors.green : Colors.red,
            ),
            child: Text(isAccept ? "Confirm" : "Reject"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildStayGoAppBar(context),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    "Booking Requests",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.filter_alt),
                  onPressed: () {},
                  tooltip: "Filter requests",
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                bookingCard(
                  "Hamburg Von Davidson",
                  "Single Room",
                  "+10854568090",
                  "19000979875543",
                  "Germany",
                  "#U000004790",
                ),
                bookingCard(
                  "Alan Robbert Monaco",
                  "Reception Hall",
                  "+209643435476",
                  "20787763254578",
                  "Scotland",
                  "#U000009190",
                ),
                bookingCard(
                  "Sophia Rodriguez",
                  "Double Room",
                  "+34987654321",
                  "",
                  "Spain",
                  "#U000005432",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}