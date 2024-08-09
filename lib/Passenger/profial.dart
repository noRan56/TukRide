import 'package:flutter/material.dart';
import 'package:tuk_ride/constant/MyColors.dart';

class Profial extends StatelessWidget {
  const Profial({super.key});

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
                        // child: Align(
                        //   alignment: Alignment.bottomRight,
                        //   child: CircleAvatar(
                        //     backgroundColor: Colors.white,
                        //     radius: 15,
                        //     // child: Icon(
                        //     //   Icons.edit,
                        //     //   color: Color(0xfff9c32b),
                        //     //   size: 15,
                        //     // ),
                        //   ),
                        // ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Aya Mohammed',
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
                            ' 46 rides',
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
                          "Ahmed Mohammed",
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
                          "0123456789",
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
                          "Email",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: MyColor.myBlack,
                          ),
                        ),
                        trailing: Text(
                          "email@gmail.com",
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
