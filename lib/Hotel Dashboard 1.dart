import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StayGo Hotel Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HotelDashboardPage(),
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
          iconSize: 24,
          padding: const EdgeInsets.all(8),
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
          iconSize: 24,
          padding: const EdgeInsets.all(8),
          onPressed: () {},
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: OutlinedButton(
            onPressed: () => Navigator.pushNamed(context, '/signin'),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.black),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            ),
            child: const Text(
              'Register/Login',
              style: TextStyle(color: Colors.black),
            ),
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
      body: Column(
        children: [
          const DashboardButtonsRow(),
          const SizedBox(height: 12),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                PackageCard(
                  title: "Single Room",
                  description: "1 person",
                  price: "LKR 11,299",
                  status: "Hide",
                ),
                PackageCard(
                  title: "Double Room",
                  description: "2 persons",
                  price: "LKR 19,199",
                  status: "Unhide",
                ),
                PackageCard(
                  title: "Family",
                  description: "4-5 persons",
                  price: "LKR 45,499",
                  status: "Hide",
                ),
                PackageCard(
                  title: "Reception Hall",
                  description: "150 persons",
                  price: "LKR 271,299",
                  status: "Unhide",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardButtonsRow extends StatelessWidget {
  const DashboardButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text('Add Package'),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text('Manage Bookings'),
          ),
        ],
      ),
    );
  }
}

class PackageCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String status;

  const PackageCard({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  price,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  // Handle status change
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: status == "Hide" ? Colors.grey : Colors.blue,
                ),
                child: Text(status),
              ),
            ),
          ],
        ),
      ),
    );
  }
}