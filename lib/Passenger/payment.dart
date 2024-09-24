import 'package:flutter/material.dart';
import 'package:tuk_ride/core/constant/MyColors.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _formKey = GlobalKey<FormState>();
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
          onPressed: () {
            Navigator.pop(context);
          },
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
        child: Form(
          key: _formKey,
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
              ElevatedButton(
                onPressed: _validateForm,
                child: Text('Proceed'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: MyColor.myWhite,
                  backgroundColor: MyColor.myYellow,
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 5,
                width: 180,
                decoration: const BoxDecoration(
                    color: MyColor.myGrey,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
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
          if (_formKey.currentState!.validate()) {
            Navigator.of(context).pushReplacementNamed('paymentCard');
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Please select a payment method.')),
            );
          }
        },
      ),
      onTap: () {
        setState(() {
          _selectedPaymentMethod = title;
        });
      },
    );
  }

  void _validateForm() {
    if (_selectedPaymentMethod.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a payment method.')),
      );
    } else {
      // Proceed with the payment process or navigation
      Navigator.of(context).pushReplacementNamed('paymentCard');
    }
  }
}
