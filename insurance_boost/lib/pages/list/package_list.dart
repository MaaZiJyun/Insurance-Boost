import 'package:flutter/material.dart';

class PackageList extends StatefulWidget {
  const PackageList({Key? key}) : super(key: key);

  @override
  _PackageListState createState() => _PackageListState();
}

class _PackageListState extends State<PackageList> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  final List<Map<String, dynamic>> _allUsers = [
    {
      "id": 1,
      "name": 'GX8090',
      "price": 20,
      "detail":
          '·this is the detail of package 1\n·this is the detail of package 1\n·this is the detail of package 1\n',
      "category": 'health care',
      "point": 10,
    },
    {
      "id": 1,
      "name": 'GX8090',
      "price": 20,
      "detail":
          '·this is the detail of package 1\n·this is the detail of package 1\n·this is the detail of package 1\n',
      "category": 'health care',
      "point": 10,
    },
    {
      "id": 1,
      "name": 'GX8090',
      "price": 20,
      "detail":
          '·this is the detail of package 1\n·this is the detail of package 1\n·this is the detail of package 1\n',
      "category": 'health care',
      "point": 10,
    },
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // // This function is called whenever the text field changes
  // void _runFilter(String enteredKeyword) {
  //   List<Map<String, dynamic>> results = [];
  //   if (enteredKeyword.isEmpty) {
  //     // if the search field is empty or only contains white-space, we'll display all users
  //     results = _allUsers;
  //   } else {
  //     results = _allUsers
  //         .where((user) =>
  //             user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
  //         .toList();
  //     // we use the toLowerCase() method to make it case-insensitive
  //   }

  //   // Refresh the UI
  //   setState(() {
  //     _foundUsers = results;
  //   });
  // }

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
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // TextField(
            //   onChanged: (value) => _runFilter(value),
            //   decoration: const InputDecoration(
            //     labelText: 'Search',
            //     suffixIcon: Icon(Icons.search),
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_foundUsers[index]["id"]),
                        color: Colors.white,
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    _foundUsers[index]['name'],
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  StatusTag(
                                      color: Colors.green,
                                      text: _foundUsers[index]['category']),
                                  SizedBox(
                                    width: width / 8,
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(40.0),
                                      ),
                                      primary: Colors.teal, // background
                                      backgroundColor:
                                          Colors.white, // foreground
                                      elevation: 0,
                                      side: BorderSide(
                                          color: Colors.teal, width: 2),
                                    ),
                                    onPressed: () {},
                                    child: Text('Buy Now'),
                                  ),
                                ],
                              ),
                              Text(
                                'CNY ${_foundUsers[index]['price'].toString()} / Year',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                _foundUsers[index]['detail'],
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatusTag extends StatelessWidget {
  final Color color;
  final String text;
  const StatusTag({Key? key, required this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
