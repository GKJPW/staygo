import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class PendingRequestsPage extends StatefulWidget {
  const PendingRequestsPage({super.key});

  @override
  State<PendingRequestsPage> createState() => _PendingRequestsPageState();
}

class _PendingRequestsPageState extends State<PendingRequestsPage> {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref('pending_requests');
  List<Map<dynamic, dynamic>> _requests = [];

  @override
  void initState() {
    super.initState();
    _loadRequests();
  }

  void _loadRequests() {
    _dbRef.onValue.listen((event) {
      final data = event.snapshot.value;
      if (data != null && data is Map) {
        setState(() {
          _requests = data.entries.map((entry) {
            return {
              "id": entry.key,
              ...Map<String, dynamic>.from(entry.value),
            };
          }).toList();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pending Requests"),
        backgroundColor: Colors.lightBlue[100],
      ),
      body: _requests.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _requests.length,
        itemBuilder: (context, index) {
          final request = _requests[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(request['hotel_name'] ?? 'No Name'),
              subtitle: Text(request['location'] ?? 'No Location'),
              trailing: Text(request['status'] ?? 'Pending'),
            ),
          );
        },
      ),
    );
  }
}
