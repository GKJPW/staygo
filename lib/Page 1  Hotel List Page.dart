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
      home: const HotelListPage(),
    );
  }
}

class HotelListPage extends StatelessWidget {
  const HotelListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hotels')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Text('"Find your perfect deal, anytime, anywhere!"'),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search Hotels ...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: () {}, child: const Text("Go")),
                const SizedBox(width: 5),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_list),
                  label: const Text("Filter by"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                children: List.generate(3, (index) => HotelCard(index: index)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final int index;
  
  const HotelCard({required this.index, super.key});
  
  final List<Map<String, String>> hotels = const [
    {
      'name': 'Ocean View Surfing Luxury A...',
      'rating': '4.8',
      'stars': '5 Star Hotel',
      'place': 'Kaluthara',
      'price': 'LKR 21899'
    },
    {
      'name': 'Western Valley Holiday Reso...',
      'rating': '4.9',
      'stars': '4 Star Hotel',
      'place': 'Galle',
      'price': 'LKR 14899'
    },
    {
      'name': 'Norman Hills Cabanas',
      'rating': '4.8',
      'stars': '3 Star Hotel',
      'place': 'Nuwara Eliya',
      'price': 'LKR 11409'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final h = hotels[index];
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            color: Colors.grey[300],
            child: const Center(child: Text('Hotel Image', style: TextStyle(color: Colors.grey))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(h['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text("${h['stars']} - ${h['place']}"),
                const SizedBox(height: 4),
                Text("Starting from: ${h['price']}", style: const TextStyle(color: Colors.blue)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}