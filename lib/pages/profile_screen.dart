// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class ProfileScreen extends StatefulWidget {
  var phoneNumber;
  ProfileScreen(this.phoneNumber);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var _formKey = GlobalKey<FormState>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  var _controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(50, 120, 50, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Profile',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _controllers[0],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ismni kiriting';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Ism',
                        fillColor: Color.fromRGBO(242, 242, 242, 1),
                        filled: true,
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _controllers[1],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Tumanni kiriting';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Tuman',
                        fillColor: Color.fromRGBO(242, 242, 242, 1),
                        filled: true,
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _controllers[2],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ko\'cha kiriting';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Ko\'cha',
                        fillColor: Color.fromRGBO(242, 242, 242, 1),
                        filled: true,
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _controllers[3],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Dom raqamini kiriting';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Dom',
                        fillColor: Color.fromRGBO(242, 242, 242, 1),
                        filled: true,
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _controllers[4],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Kvartira raqamini kiriting';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Kvartira',
                        fillColor: Color.fromRGBO(242, 242, 242, 1),
                        filled: true,
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        fixedSize: Size(290, 55),
                        primary: Color.fromRGBO(0, 227, 173, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          //show circular progress
                          showDialog(
                            context: context,
                            builder: (context) => Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                          
                          var _isUseradded = await addUser(
                              _controllers[0].text,
                              _controllers[1].text,
                              _controllers[2].text,
                              _controllers[3].text,
                              _controllers[4].text);

                          if (_isUseradded) {
                            //pop
                            // Navigator.pop(context);
                            //show snackbar
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Muvaffaqiyatli qo\'shildingiz',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                                duration: Duration(seconds: 5),
                              ),
                            );
                            
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          }
                        }
                      },
                      child: Text(
                        "Saqlash",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Future<bool> addUser(String ism, String tuman, String street, String dom,
      String kvartira) async {
    // Call the user's CollectionReference to add a new user

    try {
      await users.add({
        'name': ism, // John Doe
        'tuman': tuman, // Stokes and Sons
        'street': street,
        'dom': dom,
        'kvartira': kvartira,
        'phoneNumber': widget.phoneNumber,
      });
      return Future.value(true);
    } catch (e) {
      return Future.value(false);
    }
  }
}
