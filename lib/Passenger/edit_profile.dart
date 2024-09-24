import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tuk_ride/core/constant/MyColors.dart';
import 'package:http/http.dart' as http;
import 'package:tuk_ride/core/helpers/api_url.dart';
import 'package:tuk_ride/shared_pref_helper.dart';

class EditProfilePageU extends StatefulWidget {
  const EditProfilePageU({super.key});

  @override
  State<EditProfilePageU> createState() => _EditProfilePageUState();
}

class _EditProfilePageUState extends State<EditProfilePageU> {
  String fName = '';
  String mobile = '';
  String email = '';
  // var lNameController = TextEditingController();
  // var emailController = TextEditingController();
  // var passwordController = TextEditingController();
  // var mobileNumberController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<bool> _getData() async {
    var request = http.Request('GET', Uri.parse('${UrlApi.url}/user/profile'));

    request.headers['Content-Type'] = 'application/json';
    request.headers['Authorization'] =
        'Bearer ' + await SharedPrefHelper.getData(key: 'token');

    log(await SharedPrefHelper.getData(key: 'token'));
    http.StreamedResponse response = await request.send();

    // log(response.statusCode.toString());
    String responseString = await response.stream.bytesToString();
    // log(responseString);

    if (response.statusCode == 200) {
      // Decode the JSON response
      var responseJson = jsonDecode(responseString);
      email = responseJson['data']['user']['useremail'];
      mobile = responseJson['data']['user']['userphone'];
      fName = responseJson['data']['user']['name'];

      setState(() {});
      // Extract token and user data
      log("'==============$email==============");
      // Store token and user data in Shared Preferences

      return true;
    } else {
      return false;
    }
  }
  // File? _image;

  // Future<void> _pickImage() async {
  //   final ImagePicker _picker = ImagePicker();
  //   final XFile? pickedFile =
  //       await _picker.pickImage(source: ImageSource.gallery);

  //   if (pickedFile != null) {
  //     setState(() {
  //       _image = File(pickedFile.path);
  //     });
  //   } else {
  //     print('No image selected.');
  //   }
  // }

  // Future<void> _updateData() async {
  //   var request = http.MultipartRequest(
  //       'PATCH', Uri.parse('${UrlApi.url}/user/updateMe'));
  //   request.fields.addAll({
  //     'name': fName,
  //     'useremail': email,
  //     'userphone': mobile,
  //   });
  //   request.files
  //       .add(await http.MultipartFile.fromPath('photo', '${_image?.path}'));
  //   request.headers['Content-Type'] = 'application/json';
  //   request.headers['Authorization'] =
  //       'Bearer ' + await SharedPrefHelper.getData(key: 'token');
  //   http.StreamedResponse response = await request.send();

  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     print(await response.stream.bytesToString());
  //   } else {
  //     print(response.reasonPhrase);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/images/back.png'),
          onPressed: () {},
        ),
        title: Text('Edit Profile'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Color(0xFFF9C32B),
                height: 5.0,
                width: 144.0,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Center(
                child: CircleAvatar(
                  radius: 50,
                  // backgroundImage: AssetImage(''),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 15,
                      // child: IconButton(
                      //   onPressed: () {},
                      //   icon: Image.asset(
                      //     'assets/images/Grou7433.png',
                      //     width: 25,
                      //     height: 25,
                      //   ),
                      // ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  fName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('Full Name'),
              SizedBox(height: 5),
              Text(
                fName,
              ),
              SizedBox(height: 20),
              Text('Phone number'),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 12),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/flag.png',
                            width: 30,
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                    VerticalDivider(
                      color: Colors.grey,
                      thickness: 1,
                      width: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text('+02'),
                    ),
                    Expanded(
                      child: Text(
                        mobile,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text('Email'),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  email,
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _getData();
                    SnackBar(
                      content: Text('Everything is saved!'),
                      duration: Duration(seconds: 2),
                    );
                    Navigator.of(context).pushReplacementNamed('NavBar');
                  },
                  child: Text('Save Changes',
                      style: TextStyle(
                        color: MyColor.myBlack,
                        fontSize: 20,
                      )),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xfff9c32b),
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                    textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff242424)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
