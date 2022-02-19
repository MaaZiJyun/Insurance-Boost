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
  String searchItem = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.teal[50],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // HeaderWithSearchBox(size: size),
            Container(
              margin: EdgeInsets.only(bottom: 20 * 2.5),
              // It will cover 20% of our total height
              height: size.height * 0.2,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 36 + 20,
                    ),
                    height: size.height * 0.2 - 27,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Good morning, User',
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        // Image.asset("assets/images/logo.png")
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 54,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: Colors.teal.withOpacity(0.23),
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  searchItem = value;
                                });
                              },
                              decoration: InputDecoration(
                                hintText: "Search your Submission ID...",
                                hintStyle: TextStyle(
                                  color: Colors.teal.withOpacity(0.5),
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                // surffix isn't working properly with SVG
                                // thats why we use row
                                // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                              ),
                            ),
                          ),
                          // SvgPicture.asset("assets/icons/search.svg"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            searchItem == ''
                ? TitleWithMoreBtn(title: "Recomended", press: () {})
                : SizedBox(height: 0),
            searchItem == '' ? RecomendsPlants() : Text(searchItem),
            searchItem == ''
                ? TitleWithMoreBtn(title: "Featured Plants", press: () {})
                : SizedBox(height: 0),
            searchItem == '' ? FeaturedPlants() : SizedBox(height: 0),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
