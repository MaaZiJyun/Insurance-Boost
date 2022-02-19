import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insurance_boost/pages/detail_pages/pdf_detail_page.dart';
import 'package:insurance_boost/pages/detail_pages/submission_detail_page.dart';

// import '../../../constants.dart';

class MySubmissions extends StatelessWidget {
  const MySubmissions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          MySubmissionsCard(
            image: "image/img2.png",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SubmissionDetailPage(),
                ),
              );
            },
          ),
          MySubmissionsCard(
            image: "image/img2.png",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class MySubmissionsCard extends StatelessWidget {
  const MySubmissionsCard({
    Key? key,
    required this.image,
    required this.press,
  }) : super(key: key);
  final String image;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => press(),
      child: Container(
        margin: EdgeInsets.only(
          left: 20,
          top: 10,
          bottom: 10,
        ),
        width: size.width * 0.8,
        height: 185,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
