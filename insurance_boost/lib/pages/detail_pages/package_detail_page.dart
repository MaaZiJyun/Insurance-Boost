import 'package:flutter/material.dart';

class PackageDetailPage extends StatefulWidget {
  final String id;
  final String detail;
  final int price;
  final String category;
  final int point;
  final String code;

  const PackageDetailPage({
    Key? key,
    required this.id,
    required this.detail,
    required this.price,
    required this.category,
    required this.point,
    required this.code,
  }) : super(key: key);

  @override
  _PackageDetailPageState createState() => _PackageDetailPageState();
}

class _PackageDetailPageState extends State<PackageDetailPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey[800],
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.code,
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    StatusTag(text: widget.category),
                  ],
                ),
                Text(
                  "￥ ${widget.price}  / Year",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.detail,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.teal,
        onPressed: () {},
        label: Text('Buy Now'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class StatusTag extends StatelessWidget {
  late Color color;
  final String text;
  StatusTag({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (text == 'Life') {
      color = Colors.red;
    } else if (text == 'Health') {
      color = Colors.green;
    } else {
      color = Colors.orange;
    }

    return Container(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      decoration: BoxDecoration(
          color: color,
          // border: Border.all(color: Colors.teal, width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(40))),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
