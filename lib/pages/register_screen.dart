// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:promastero/pages/profile_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var _phoneController = TextEditingController();
  var _phoneFormKey = GlobalKey<FormState>();
  var _otpFormKey = GlobalKey<FormState>();
  String centerText = "Xush Kelibsiz";
  Widget? _form;
  bool _isPhoneForm = true;

  @override
  void dispose() {
    _phoneController.dispose();
    // _phoneFormKey.currentState!.dispose();
    // _otpFormKey.currentState!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _form = _buildPhoneForm();
    super.initState();
  }

  Widget _buildPhoneForm() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 70, 20, 0),
      // phone number textfield
      child: Form(
        key: _phoneFormKey,
        child: SizedBox(
          width: 290,
          child: TextFormField(
            controller: _phoneController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Telefon nomer kiriting';
              }
              if (int.tryParse(value) == null) {
                return 'Iltimos, faqat raqam kiriting';
              }
              return null;
            },
            keyboardType: TextInputType.phone,
            maxLength: 9,
            decoration: InputDecoration(
              prefixText: "+998",
              labelText: "Telefon nomer",
              labelStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOtpForm() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 70, 20, 0),
      // phone number textfield
      child: Form(
        key: _otpFormKey,
        child: SizedBox(
          width: 120,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Iltimos kodni kiriting';
              }
              if (int.tryParse(value) == null) {
                return 'Iltimos, faqat raqam kiriting';
              }
              return null;
            },
            style: TextStyle(fontSize: 32),
            keyboardType: TextInputType.number,
            maxLength: 4,
            decoration: InputDecoration(
              labelText: "Kod",
              labelStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(88.0, 80.0, 0, 0),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      // paddin g: const EdgeInsets.only(left: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.0),
                        color: Color.fromRGBO(57, 255, 185, 1),
                      ),
                      width: 70,
                      height: 50,
                      child: Text(
                        "Pro",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 31,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.zero,
                          bottomLeft: Radius.zero,
                          bottomRight: Radius.circular(9.0),
                          topRight: Radius.circular(9.0),
                        ),
                        color: Colors.black,
                      ),
                      width: 140,
                      height: 50,
                      child: Text(
                        "Mastero",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 31,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Text(
                  centerText,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              _form!,
              // Elevatedbutton with green background
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 20, 50, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    fixedSize: Size(290, 55),
                    primary: Color.fromRGBO(0, 227, 173, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    if (_isPhoneForm) {
                      if (_phoneFormKey.currentState!.validate()) {
                        setState(() {
                          _form = _buildOtpForm();
                          _isPhoneForm = false;
                          centerText = "Kod Yubordik";
                        });
                      }
                    } else {
                      if (_otpFormKey.currentState!.validate()) {
                        var phone = _phoneController.text;
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(phone),
                          ),
                        );
                      }
                    }
                  },
                  child: Text(
                    "Yuborish",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
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
