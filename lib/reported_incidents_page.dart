import 'package:flutter/material.dart';

class ReportedIncidentsPage extends StatelessWidget {
  const ReportedIncidentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dummyReports = [
      {
        'reporterId': '#U000002301',
        'about': '#H000001COL',
        'message': 'Message Here ' * 10
      },
      {
        'reporterId': '#U000001319',
        'about': '#Usability',
        'message': 'Message Here ' * 15
      },
      {
        'reporterId': '#U000000907',
        'about': '#Technical',
        'message': 'Message Here ' * 20
      },
    ];

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
            // Header Summary Cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _infoCard("Total Users", "2210"),
                _infoCard("Registered Hotels", "112"),
                _dummyCard("Pending Requests"),
                _dummyCard("Reported Incidents", isActive: true),
              ],
            ),
            const SizedBox(height: 10),

            // Search Bar
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search Accounts by ID ...",
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
            const SizedBox(height: 10),

            // Reported Incident Cards
            Expanded(
              child: ListView.builder(
                itemCount: dummyReports.length,
                itemBuilder: (context, index) {
                  final report = dummyReports[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.black26),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Reported By : ${report['reporterId']}"),
                          Text("About : ${report['about']}"),
                          const SizedBox(height: 5),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black38),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(report['message']!),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.check),
                                label: const Text(""),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green[100],
                                  foregroundColor: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 10),
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.delete),
                                label: const Text(""),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red[100],
                                  foregroundColor: Colors.black,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
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

  Widget _dummyCard(String title, {bool isActive = false}) {
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
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: isActive ? Colors.yellow : Colors.white,
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
