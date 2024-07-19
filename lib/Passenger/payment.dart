import 'package:flutter/material.dart';
import 'package:tuk_ride/constant/MyColors.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String _selectedPaymentMethod = 'Cash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.myWhite,
      appBar: AppBar(
        backgroundColor: MyColor.myWhite,
        leading: IconButton(
          icon: Image.asset(
            'assets/images/back.png',
            width: 30,
            height: 30,
          ),
          onPressed: () {},
        ),
        title: Text('Payment'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Color(0xFFF9C32B),
                height: 5.0,
                width: 100.0,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(color: MyColor.myWhite),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Payment method',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Color(0xFFFDFDFD),
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: MyColor.myGrey,
                        blurRadius: 6.0,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      _buildPaymentOption('Cash', 'assets/images/money.png'),
                      _buildPaymentOption('Credit/Debit/ATM Card',
                          'assets/images/credit-card.png'),
                      _buildPaymentOption('PayPal', 'assets/images/paypal.png'),
                      _buildPaymentOption(
                          'Fawry cash', 'assets/images/images.jpg'),
                      _buildPaymentOption(
                          'Mobile wallets', 'assets/images/mobile cash.png'),
                      _buildPaymentOption(
                          'Meeza Card', 'assets/images/logo-01-1.png'),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Container(
                  height: 5,
                  width: 180,
                  decoration: const BoxDecoration(
                      color: MyColor.myGrey,
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String title, String assetPath) {
    return ListTile(
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(700))),
            child: Transform.scale(
              scale: 1.2,
              child: Checkbox(
                shape: CircleBorder(),
                checkColor: MyColor.myWhite,
                activeColor: MyColor.myYellow,
                value: _selectedPaymentMethod == title,
                onChanged: (bool? value) {
                  setState(() {
                    if (value == true) {
                      _selectedPaymentMethod = title;
                    } else {
                      _selectedPaymentMethod = '';
                    }
                  });
                },
              ),
            ),
          ),
          SizedBox(width: 8),
          Image.asset(assetPath, width: 40),
        ],
      ),
      title: Text(title),
      trailing: IconButton(
        icon: Image.asset(
          'assets/images/next.png',
          width: 24,
          height: 24,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('paymentCard');
        },
      ),
      onTap: () {
        setState(() {
          _selectedPaymentMethod = title;
        });
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:tuk_ride/constant/MyColors.dart';

// class PaymentPage extends StatefulWidget {
//   @override
//   _PaymentPageState createState() => _PaymentPageState();
// }

// class _PaymentPageState extends State<PaymentPage> {
//   String _selectedPaymentMethod = 'Cash';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             padding: EdgeInsets.only(top: 20),
//             color: MyColor.myWhite,
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     IconButton(
//                       icon: Image.asset('assets/images/back.png'),
//                       onPressed: () {},
//                     ),
//                     Spacer(),
//                     Text(
//                       'Payment',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     Spacer(),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       color: Color(0xFFF9C32B),
//                       height: 5.0,
//                       width: 90.0,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           // Body content
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Container(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       'Payment method',
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   Center(
//                     child: Container(
//                       width: MediaQuery.of(context).size.width * 0.8,
//                       decoration: BoxDecoration(
//                         color: Color(0xFFFDFDFD),
//                         borderRadius: BorderRadius.circular(8.0),
//                         boxShadow: [
//                           BoxShadow(
//                             color: MyColor.myGrey,
//                             blurRadius: 6.0,
//                             offset: Offset(0, 3),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         children: [
//                           _buildPaymentOption(
//                               'Cash', 'assets/images/money.png'),
//                           _buildPaymentOption('Credit/Debit/ATM Card',
//                               'assets/images/credit-card.png'),
//                           _buildPaymentOption(
//                               'PayPal', 'assets/images/paypal.png'),
//                           _buildPaymentOption(
//                               'Fawry cash', 'assets/images/images.jpg'),
//                           _buildPaymentOption('Mobile wallets',
//                               'assets/images/mobile cash.png'),
//                           _buildPaymentOption(
//                               'Meeza Card', 'assets/images/logo-01-1.png'),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Spacer(),
//                   Container(
//                     height: 5,
//                     width: 180,
//                     decoration: const BoxDecoration(
//                         color: Color(0xFF242424),
//                         borderRadius: BorderRadius.all(Radius.circular(10))),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPaymentOption(String title, String assetPath) {
//     return ListTile(
//       leading: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(700))),
//             child: Transform.scale(
//               scale: 1.2,
//               child: Checkbox(
//                 shape: CircleBorder(),
//                 checkColor: MyColor.myWhite,
//                 activeColor: MyColor.myYellow,
//                 value: _selectedPaymentMethod == title,
//                 onChanged: (bool? value) {
//                   setState(() {
//                     if (value == true) {
//                       _selectedPaymentMethod = title;
//                     } else {
//                       _selectedPaymentMethod = '';
//                     }
//                   });
//                 },
//               ),
//             ),
//           ),
//           SizedBox(width: 8),
//           Image.asset(assetPath, width: 40),
//         ],
//       ),
//       title: Text(title),
//       trailing: IconButton(
//         icon: Image.asset(
//           'assets/images/next.png',
//           width: 24,
//           height: 24,
//         ),
//         onPressed: () {
//           Navigator.of(context).pushNamed('paymentCard');
//         },
//       ),
//       onTap: () {
//         setState(() {
//           _selectedPaymentMethod = title;
//         });
//       },
//     );
//   }
// }
