import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HotelListPage(), // This will show the list first
    );
  }
}

class HotelListPage extends StatelessWidget {
  const HotelListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hotels')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Western Valley Holiday Resort'),
            subtitle: const Text('Galle • 4.9 ★'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HotelDetailsPage()),
              );
            },
          ),
          // Add more hotels here if needed
        ],
      ),
    );
  }
}

class HotelDetailsPage extends StatelessWidget {
  const HotelDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotel Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hotel name and rating
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Text(
                    "Western Valley Holiday Resort Corporation PLC",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star, color: Colors.white, size: 16),
                      SizedBox(width: 4),
                      Text(
                        "4.9",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Image gallery placeholder
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Icon(Icons.photo_camera, size: 50, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 12),

            // Facilities
            const Text(
              "Facilities:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: const [
                Chip(label: Text("Accommodation")),
                Chip(label: Text("Food & Beverages")),
                Chip(label: Text("Swimming Pool")),
                Chip(label: Text("Free WiFi")),
                Chip(label: Text("Parking")),
              ],
            ),
            const SizedBox(height: 12),

            // Contact info
            const Text(
              "Contact Information:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Icon(Icons.location_on, size: 16),
                SizedBox(width: 8),
                Text("122/7 Hikkaduwa, Galle"),
              ],
            ),
            const SizedBox(height: 4),
            const Row(
              children: [
                Icon(Icons.phone, size: 16),
                SizedBox(width: 8),
                Text("+947770679679"),
              ],
            ),
            const SizedBox(height: 4),
            const Row(
              children: [
                Icon(Icons.email, size: 16),
                SizedBox(width: 8),
                Text("westvalleylpc@gmail.com"),
              ],
            ),
            const SizedBox(height: 12),

            // Description
            const Text(
              "Description",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "Experience luxury and comfort at Western Valley Holiday Resort. "
              "Whether you're looking for a relaxing getaway or a business stay, "
              "our resort offers premium amenities and exceptional service to "
              "make your stay memorable.",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),

            // Rooms section
            const Text(
              "Rooms",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            ..._buildRoomList(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: ElevatedButton(
          onPressed: () {},
          child: const Text("Book Now"),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildRoomList() {
    final rooms = [
      {"type": "Single", "price": "LKR 14,899", "capacity": "1 Adult"},
      {"type": "Double", "price": "LKR 19,499", "capacity": "2 Adults"},
      {"type": "Family", "price": "LKR 29,690", "capacity": "2 Adults + 2 Children"},
      {"type": "Suite", "price": "LKR 39,900", "capacity": "2 Adults"},
      {"type": "Reception Hall", "price": "LKR 247,909", "capacity": "100 Persons"},
    ];

    return rooms.map((room) => Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Icon(Icons.king_bed, size: 30, color: Colors.grey),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${room['type']} Room",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(room['capacity']!),
                  const SizedBox(height: 4),
                  Text(
                    "Full Day - ${room['price']}",
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Book"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(80, 40),
              ),
            ),
          ],
        ),
      ),
    )).toList();
  }
}