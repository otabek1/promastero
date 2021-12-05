// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:promastero/pages/categories_screen.dart';
import 'package:promastero/pages/order_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

var listItemInfo = [
  {
    "path": "assets/washing_machine.png",
    "title": "Kir mashina tuzatish",
    "price": "200 ming so'mdan",
  },
  {
    "path": "assets/fridge.png",
    "title": "Sovutgich tuzatish",
    "price": "200 ming so'mdan",
  },
  {
    "path": "assets/door_lock.png",
    "title": "Eshik qulfi ochish",
    "price": "30 ming so'mdan",
  }
];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 30, 15, 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/banner.png",
                    alignment: Alignment.center,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Kategoriya",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => CategoriesScreen()));
                    },
                    icon: Icon(Icons.arrow_right),
                    label: Text(
                      "Barchasini ko'rsatish",
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 40),
              SizedBox(
                height: 300,
                width: double.infinity,
                child: ListView.builder(
                    itemBuilder: (_, index) {
                      return buildListItem(
                          context,
                          listItemInfo[index]["path"]!,
                          listItemInfo[index]["title"]!,
                          listItemInfo[index]["price"]!);
                    },
                    itemCount: 3),
              ),
              SizedBox(height: 30),
              SizedBox(
                child: Text(
                  "Ommabob",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildCard("assets/ac_master.png",
                          "Konditsioner gaz to'ldirish"),
                      SizedBox(width: 10),
                      _buildCard("assets/plumber.png", "Jo'mrak o'rnatish"),
                    ],
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

buildListItem(BuildContext context, String path, String title, String price) {
  return Container(
    margin: EdgeInsets.only(bottom: 20),
    child: GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => OrderScreen(path, title)));
      },
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        tileColor: Colors.grey[200],
        contentPadding: EdgeInsets.fromLTRB(10, 10, 20, 0),
        leading: Image.asset(
          path,
          scale: 0.2,
          height: 64,
          width: 64,
        ),
        isThreeLine: false,
        title: Text(
          title,
          style: TextStyle(fontSize: 22),
        ),
        subtitle: Text(price),
        trailing: Icon(Icons.arrow_right),
      ),
    ),
  );
}

_buildCard(String path, String title) {
  return Container(
    padding: EdgeInsets.all(10),
    width: 250,
    height: 200,
    child: Stack(children: [
      Positioned.fill(
        child: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey,
                blurRadius: 5,
                offset: Offset(0, 7),
              ),
            ],
            image: DecorationImage(
              image: AssetImage(path),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Positioned.fill(
        child: Container(
          // padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(0, 227, 173, 1),
                Colors.transparent,
                Colors.transparent,
                Color.fromRGBO(0, 227, 173, 1),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0, 0, 0.3, 1],
            ),
          ),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 40, bottom: 10),
            child: Text(title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0)),
          ),
        ],
      ),
    ]),
  );
}
