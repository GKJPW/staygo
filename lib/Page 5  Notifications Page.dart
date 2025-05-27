import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notification App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 1,
        ),
      ),
      home: const NotificationsPage(),
    );
  }
}

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<Map<String, String>> notifications = [
    {
      "text": "Luxe Villa Grand approved your booking request",
      "type": "normal",
      "time": "10 min ago"
    },
    {
      "text": "Your Booking request for Luxe Resort is pending",
      "type": "normal",
      "time": "1 hour ago"
    },
    {
      "text": "Administrators sent a Warning about your recent activity!",
      "type": "warning",
      "time": "2 hours ago"
    },
    {
      "text": "Administrators Reviewed Your Report successfully",
      "type": "success",
      "time": "1 day ago"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Notifications",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: notifications.isEmpty ? null : _showDeleteAllConfirmation,
                  child: const Text(
                    "Delete All",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: notifications.isEmpty
                ? const Center(
                    child: Text(
                      "No notifications",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: _refreshNotifications,
                    child: ListView.separated(
                      itemCount: notifications.length,
                      separatorBuilder: (context, index) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final note = notifications[index];
                        return Dismissible(
                          key: Key(note['text']!),
                          background: Container(color: Colors.red),
                          secondaryBackground: Container(color: Colors.red),
                          confirmDismiss: (direction) async {
                            return await _showDeleteConfirmation(note);
                          },
                          onDismissed: (direction) {
                            setState(() {
                              notifications.removeAt(index);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Notification deleted'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          child: _buildNotificationCard(note, context),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard(Map<String, String> note, BuildContext context) {
    Color? bgColor;
    IconData? icon;
    
    switch (note['type']) {
      case 'warning':
        bgColor = Colors.yellow[100];
        icon = Icons.warning_amber_rounded;
        break;
      case 'success':
        bgColor = Colors.green[100];
        icon = Icons.check_circle;
        break;
      default:
        bgColor = Theme.of(context).cardColor;
        icon = Icons.notifications;
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      color: bgColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => _handleNotificationTap(note),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Icon(icon, color: _getIconColor(note['type']),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      note['text']!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      note['time']!,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, size: 20),
                onPressed: () async {
                  final shouldDelete = await _showDeleteConfirmation(note);
                  if (shouldDelete ?? false) {
                    setState(() {
                      notifications.remove(note);
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getIconColor(String? type) {
    switch (type) {
      case 'warning':
        return Colors.orange;
      case 'success':
        return Colors.green;
      default:
        return Theme.of(context).primaryColor;
    }
  }

  Future<void> _refreshNotifications() async {
    // Simulate network refresh
    await Future.delayed(const Duration(seconds: 1));
    setState(() {});
  }

  void _handleNotificationTap(Map<String, String> note) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Notification Details'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(note['text']!),
            const SizedBox(height: 8),
            Text(
              note['time']!,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<bool?> _showDeleteConfirmation(Map<String, String> note) async {
    return await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Notification?'),
        content: Text('Delete "${note['text']}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteAllConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete All Notifications?'),
        content: const Text('This will remove all your notifications.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                notifications.clear();
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('All notifications deleted'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: const Text(
              'Delete All',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}