import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staygo_v2/login.dart';
import 'package:staygo_v2/signin.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HotelRegistrationPage(),
    );
  }
}

class HotelRegistrationPage extends StatefulWidget {
  @override
  _HotelRegistrationPageState createState() => _HotelRegistrationPageState();
}

class _HotelRegistrationPageState extends State<HotelRegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedStar;
  String? _selectedDistrict;
  List<File> _images = [];
  final List<String> _facilities = [
    "Accomodation",
    "Food & Beverages",
    "Swimming Pool",
    "Beach",
    "Hiking",
    "Safari",
    "Events",
    "Sports",
    "Parking Lot",
    "Free Internet",
  ];
  final Map<String, bool> _selectedFacilities = {};

  final List<String> _stars = [
    "5 star",
    "4 star",
    "3 star",
    "2 star",
    "1 star",
  ];

  final List<String> _districts = [
    "Ampara",
    "Anuradhapura",
    "Badulla",
    "Batticaloa",
    "Colombo",
    "Galle",
    "Gampaha",
    "Hambantota",
    "Jaffna",
    "Kalutara",
    "Kandy",
    "Kegalle",
    "Kilinochchi",
    "Kurunegala",
    "Mannar",
    "Matale",
    "Matara",
    "Monaragala",
    "Mullaitivu",
    "Nuwara Eliya",
    "Polonnaruwa",
    "Puttalam",
    "Ratnapura",
    "Trincomalee",
    "Vavuniya",
  ];

  Future<void> _pickImages() async {
    final List<XFile>? picked = await ImagePicker().pickMultiImage();
    if (picked != null && picked.length + _images.length <= 6) {
      setState(() {
        _images.addAll(picked.map((x) => File(x.path)));
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("You can upload up to 6 images.")),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    for (var facility in _facilities) {
      _selectedFacilities[facility] = false;
    }
  }

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
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic),
                ),
              ),
              OutlinedButton(
                onPressed: () => Navigator.pushNamed(context, '/signin'),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.black),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                ),
                child: Text('Register/Login',
                    style: TextStyle(color: Colors.black)),
              ),
              IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
              IconButton(icon: Icon(Icons.logout), onPressed: () {}),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Hotel Registration',
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              _buildTextField("Email"),
              _buildTextField("Password", obscure: true),
              _buildTextField("Hotel Name"),
              DropdownButtonFormField<String>(
                value: _selectedStar,
                decoration: InputDecoration(labelText: "Star Rating"),
                items: _stars.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) =>
                    setState(() => _selectedStar = newValue),
              ),
              DropdownButtonFormField<String>(
                value: _selectedDistrict,
                decoration: InputDecoration(labelText: "District"),
                items: _districts.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) =>
                    setState(() => _selectedDistrict = newValue),
              ),
              _buildTextField("Address"),
              _buildTextField("Contact Number"),
              _buildTextField("Description"),
              SizedBox(height: 10),
              Center(
                child: Text(
                  'Select Available Facilities',
                  style: GoogleFonts.roboto(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Column(
                children: _facilities.map((facility) {
                  return CheckboxListTile(
                    title: Text(facility),
                    value: _selectedFacilities[facility],
                    onChanged: (val) {
                      setState(() {
                        _selectedFacilities[facility] = val ?? false;
                      });
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              Text("Upload Photos (Max 6)"),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _images
                    .map((img) => Image.file(img,
                        width: 100, height: 100, fit: BoxFit.cover))
                    .toList(),
              ),
              TextButton(
                onPressed: _pickImages,
                child: Text("Select Images"),
              ),
              SizedBox(height: 20),
              Center(
                child: OutlinedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Submit logic here
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Form Submitted")),
                        
                      );
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 70, vertical: 9),
                    backgroundColor: Color.fromARGB(255, 160, 220, 235),
                  ),
                  child: Text("Submit",
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: RichText(
                  text: TextSpan(
                    style:
                        GoogleFonts.roboto(color: Colors.black, fontSize: 16),
                    children: [
                      TextSpan(text: "Already have an account? "),
                      TextSpan(
                        text: "Log In",
                        style: TextStyle(color: Colors.blueAccent),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: RichText(
                  text: TextSpan(
                    style:
                        GoogleFonts.roboto(color: Colors.black, fontSize: 16),
                    children: [
                      TextSpan(text: "Prefer Signing as a User? "),
                      TextSpan(
                        text: "Sign In",
                        style: TextStyle(color: Colors.blueAccent),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInPage()));
                          },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, {bool obscure = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        validator: (value) =>
            value == null || value.isEmpty ? "Enter $label" : null,
      ),
    );
  }
}
