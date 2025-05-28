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
        '/report-problem': (context) => const ReportProblemPage(),
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
            Navigator.pushNamed(context, '/report-problem');
          },
          child: const Text('Report a Problem'),
        ),
      ),
    );
  }
}

class ReportProblemPage extends StatelessWidget {
  const ReportProblemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: buildStayGoAppBar(context),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const DashboardButtonsRow(),
              Padding(
                padding: const EdgeInsets.all(16