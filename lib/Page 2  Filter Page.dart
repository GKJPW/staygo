import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel Filter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HotelListPage(), // Starting with the list page
    );
  }
}

class HotelListPage extends StatelessWidget {
  const HotelListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotels'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HotelFilterPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HotelFilterPage()),
            );
          },
          child: const Text('Open Filters'),
        ),
      ),
    );
  }
}

class HotelFilterPage extends StatelessWidget {
  const HotelFilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Hotels'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CheckboxListTile(
                value: true, 
                onChanged: null,
                title: Text("Highest Customer Rating First"),
              ),
              const SizedBox(height: 16),
              
              // Star Rating Section
              Row(
                children: [
                  const Text("Star Rating:"),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DropdownButton<String>(
                      items: const [
                        DropdownMenuItem(value: '5', child: Text('5 Stars')),
                        DropdownMenuItem(value: '4', child: Text('4 Stars')),
                        DropdownMenuItem(value: '3', child: Text('3 Stars')),
                        DropdownMenuItem(value: '2', child: Text('2 Stars')),
                        DropdownMenuItem(value: '1', child: Text('1 Star')),
                      ], 
                      onChanged: (_) {}, 
                      hint: const Text("Select Level"),
                      isExpanded: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // Price Range Section
              const Text("Price Range:"),
              const SizedBox(height: 8),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: "Min",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text("to"),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 80,
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: "Max",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      Row(
                        children: [
                          Radio<bool>(
                            value: true, 
                            groupValue: true, 
                            onChanged: (_) {},
                          ),
                          const Text("asc"),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<bool>(
                            value: false, 
                            groupValue: true, 
                            onChanged: (_) {},
                          ),
                          const Text("desc"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // District Section
              Row(
                children: [
                  const Text("District:"),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DropdownButton<String>(
                      items: const [
                        DropdownMenuItem(value: 'Colombo', child: Text('Colombo')),
                        DropdownMenuItem(value: 'Galle', child: Text('Galle')),
                        DropdownMenuItem(value: 'Kandy', child: Text('Kandy')),
                      ], 
                      onChanged: (_) {}, 
                      hint: const Text("Select a District"),
                      isExpanded: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // Facilities Section
              const Text("Facilities:"),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: [
                  FacilityCheck("Accommodation", true),
                  FacilityCheck("Food & Beverages", true),
                  FacilityCheck("Swimming Pool", true),
                  FacilityCheck("Beach", false),
                  FacilityCheck("Events", false),
                  FacilityCheck("Sports", false),
                  FacilityCheck("Parking Lot", false),
                  FacilityCheck("Free Internet", true),
                ],
              ),
              const SizedBox(height: 24),
              
              // Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {}, 
                    child: const Text("Clear"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    }, 
                    child: const Text("Apply Filters"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget FacilityCheck(String label, bool checked) {
    return Row(
      mainAxisSize: MainAxisSize.min, 
      children: [
        Checkbox(
          value: checked, 
          onChanged: (_) {},
        ),
        Text(label),
      ],
    );
  }
}