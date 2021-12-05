// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:promastero/pages/home_screen.dart';

class CategoriesScreen extends StatelessWidget {
  var categories = [
    {
      "path": "assets/tap.png",
      "title": "Santexnika",
      "price": "",
    },
    {
      "path": "assets/outlet.png",
      "title": "Elektrik",
      "price": "",
    },
    {
      "path": "assets/cockroach.png",
      "title": "Dezinfeksiya",
      "price": "",
    },
    {
      "path": "assets/furniture.png",
      "title": "Mebel Tozalash",
      "price": "",
    },
    {
      "path": "assets/washing_machine.png",
      "title": "Kir moshina tuzatish",
      "price": "",
    },
    {
      "path": "assets/fridge.png",
      "title": "Sovutgich tuzatish",
      "price": "",
    },
    {
      "path": "assets/door_lock.png",
      "title": "Qulf eshit tuzatish",
      "price": ""
    },
    {"path": "assets/ac.png", "title": "Konditsioner tuzatish", "price": ""},
    {"path": "assets/cleaning_tools.png", "title": "Uyni tozalash", "price": ""}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Text(
                "Kategoriyalar",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (_, index) {
                    return buildListItem(
                        context,
                        categories[index]["path"]!,
                        categories[index]["title"]!,
                        categories[index]["price"]!);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
