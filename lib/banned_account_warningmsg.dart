import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: HotelAccountWaitingApprovalPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HotelAccountWaitingApprovalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 160, 220, 235),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              Expanded(
                child: Text(
                  'StayGo',
                  style: GoogleFonts.teko(
                      fontSize: 20, fontWeight: FontWeight.w700, fontStyle: FontStyle.italic),
                ),
              ),
              OutlinedButton(
                onPressed: () => Navigator.pushNamed(context, '/signin'),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.black),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                ),
                child: Text('Register/Login', style: TextStyle(color: Colors.black)),
              ),
              IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
              IconButton(icon: Icon(Icons.logout), onPressed: () {}),
            ],
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'BANNED ACCOUNT',
                style: GoogleFonts.roboto(fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                '__________',
                style: GoogleFonts.roboto(fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Text(
                'Entered Login Credentials are',
                style: GoogleFonts.roboto(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              Text(
                'belongs to a Banned Account.',
                style: GoogleFonts.roboto(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Text(
                'You Cannot use',
                style: GoogleFonts.roboto(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              Text(
                'Banned Account Credentials',
                style: GoogleFonts.roboto(fontSize: 16, color: const Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                'for Signing in Again',
                style: GoogleFonts.roboto(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              OutlinedButton(
                onPressed: () {
                  // Replace this with your actual main page navigation
                  Navigator.pop(context); // e.g., Navigator.pushNamed(context, '/main');
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 160, 220, 235),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Text(
                  'Back to Sign in',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
