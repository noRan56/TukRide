import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class DriverLicenseScreen extends StatefulWidget {
  @override
  _DriverLicenseScreenState createState() => _DriverLicenseScreenState();
}

class _DriverLicenseScreenState extends State<DriverLicenseScreen> {
  TextEditingController _licenseNumberController = TextEditingController();
  TextEditingController _expirationDateController = TextEditingController();
  TextEditingController _dobController = TextEditingController();

  DateTime? _selectedDate;
  bool _isIDCardUploaded = false;
  bool _isDriverLicenseUploaded = false;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(bool isIDCard) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        if (isIDCard) {
          _isIDCardUploaded = true;
        } else {
          _isDriverLicenseUploaded = true;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {},
          child: Container(
            width: 41.6,
            height: 41.58,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFF9C32B),
            ),
            child: Center(
              child: Image.asset(
                'assets/images/back.png',
                width: 24,
                height: 24,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 39.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "Driver’s license",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              height: 1.485,
                              color: Colors.black,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 4),
                        Container(
                          width: 236,
                          height: 6,
                          color: Color(0xFFF9C32B),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Upload ID Card/Passport',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.43,
                      color: Color(0xFF242424),
                    ),
                  ),
                  SizedBox(height: 4),
                  GestureDetector(
                    onTap: () {
                      _pickImage(true);
                    },
                    child: Container(
                      width: 170,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Icon(
                              Icons.upload_file,
                              size: 30,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Upload photo(s)',
                            style: TextStyle(
                              fontFamily: 'Rounded Mplus 1c',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.714,
                              color: Color(0xFFC8C7CC),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Upload Driver’s license',
                    style: TextStyle(
                      fontFamily: 'Rounded Mplus 1c',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.43,
                      color: Color(0xFF242424),
                    ),
                  ),
                  SizedBox(height: 4),
                  GestureDetector(
                    onTap: () {
                      _pickImage(false);
                    },
                    child: Container(
                      width: 170,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Icon(
                              Icons.upload_file,
                              size: 30,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Upload photo(s)',
                            style: TextStyle(
                              fontFamily: 'Rounded Mplus 1c',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.714,
                              color: Color(0xFFC8C7CC),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'License number',
                    style: TextStyle(
                      fontFamily: 'Rounded Mplus 1c',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      height: 1.333,
                      color: Color(0xFF404040),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: _licenseNumberController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(color: Color(0xFFE9E9E9), width: 2),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Expiration date',
                    style: TextStyle(
                      fontFamily: 'Rounded Mplus 1c',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      height: 1.333,
                      color: Color(0xFF404040),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: _expirationDateController,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: 'MM/DD/YYYY',
                      hintStyle: TextStyle(
                        fontFamily: 'Rounded Mplus 1c',
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        height: 1.485,
                        color: Color(0xFFC8C7CC),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(color: Color(0xFFE9E9E9), width: 2),
                      ),
                      suffixIcon: Icon(Icons.calendar_today,
                          size: 20, color: Colors.grey),
                    ),
                    onTap: () async {
                      _selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (_selectedDate != null) {
                        _expirationDateController.text =
                            DateFormat('MM/dd/yyyy').format(_selectedDate!);
                      }
                    },
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Date of Birth',
                    style: TextStyle(
                      fontFamily: 'Rounded Mplus 1c',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      height: 1.333,
                      color: Color(0xFF404040),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: _dobController,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: 'MM/DD/YYYY',
                      hintStyle: TextStyle(
                        fontFamily: 'Rounded Mplus 1c',
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        height: 1.485,
                        color: Color(0xFFC8C7CC),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(color: Color(0xFFE9E9E9), width: 2),
                      ),
                      suffixIcon: Icon(Icons.calendar_today,
                          size: 20, color: Colors.grey),
                    ),
                    onTap: () async {
                      _selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (_selectedDate != null) {
                        _dobController.text =
                            DateFormat('MM/dd/yyyy').format(_selectedDate!);
                      }
                    },
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('verifyCode');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF9C32B),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Next',
                        style: TextStyle(
                          fontFamily: 'Rounded Mplus 1c',
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          height: 1.714,
                          color: Color(0xff242424),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
          if (_isIDCardUploaded)
            Positioned(
              top: 150,
              right: 10,
              child: Icon(Icons.check_circle, color: Colors.green, size: 30),
            ),
          if (_isDriverLicenseUploaded)
            Positioned(
              top: 290,
              right: 10,
              child: Icon(Icons.check_circle, color: Colors.green, size: 30),
            ),
        ],
      ),
    );
  }
}
