import 'package:flutter/material.dart';
import 'package:insurance_boost/pages/home/FeaturedPlants.dart';
import 'package:insurance_boost/pages/home/HeaderWithSearchBox.dart';
import 'package:insurance_boost/pages/home/RecomendsPlants.dart';
import 'package:insurance_boost/pages/home/TitleWithMoreBtn.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.teal[50],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            HeaderWithSearchBox(size: size),
            TitleWithMoreBtn(title: "Recomended", press: () {}),
            RecomendsPlants(),
            TitleWithMoreBtn(title: "Featured Plants", press: () {}),
            FeaturedPlants(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
