import 'dart:convert';

import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:tuk_ride/core/constant/MyColors.dart';
import 'package:tuk_ride/core/helpers/api_url.dart';
import 'package:tuk_ride/shared_pref_helper.dart';
import 'package:http/http.dart' as http;

class Profial extends StatefulWidget {
  Profial({super.key});

  @override
  State<Profial> createState() => _ProfialState();
}

class _ProfialState extends State<Profial> {
  String fName = '';
  String mobile = '';
  String email = '';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 40,
                            right: 290), // Adjust the distance as needed
                        child: IconButton(
                          icon: Image.asset('assets/images/back.png'),
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed('accountMenu');
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          child: Text(
                            'Profile',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Container(
                          height: 5,
                          width: 100,
                          decoration: const BoxDecoration(
                              color: Color(0xfff9c32b),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                      SizedBox(
                        height: 30,
                      ),
                      CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            AssetImage('assets/images/userAvaterpng'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        fName,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Card(
                        child: ListTile(
                          leading: Image.asset('assets/images/complete.png'),
                          title: Text(
                            " You've completed",
                            style: TextStyle(
                              color: MyColor.myBlack,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          subtitle: Text(
                            ' 4 rides',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: MyColor.myGrey),
                            textAlign: TextAlign.center,
                          ),
                          trailing: TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('history');
                            },
                            child: Text(
                              'View History',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                                color: MyColor.myYellow,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Information',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: MyColor.myBlack,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('editProfial');
                            },
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                color: MyColor.myYellow,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      ListTile(
                        leading: Text(
                          "Full Name",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: MyColor.myBlack,
                          ),
                        ),
                        trailing: Text(
                          fName,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: MyColor.myGrey,
                          ),
                        ),
                      ),
                      Divider(
                        color: MyColor.myLineColor,
                      ),
                      ListTile(
                        leading: Text(
                          "Phone number",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: MyColor.myBlack,
                          ),
                        ),
                        trailing: Text(
                          mobile,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: MyColor.myGrey,
                          ),
                        ),
                      ),
                      Divider(
                        color: MyColor.myLineColor,
                      ),
                      ListTile(
                        leading: Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: MyColor.myBlack,
                          ),
                        ),
                        trailing: Text(
                          email,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: MyColor.myGrey,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 120,
                      ),
                      Container(
                          height: 5,
                          width: 180,
                          decoration: const BoxDecoration(
                              color: MyColor.myGrey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                    ]))));
  }
}
