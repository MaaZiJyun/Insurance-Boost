import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurance_boost/global/global_variables.dart' as globals;
import 'package:insurance_boost/models/account_option_row.dart';
import 'package:insurance_boost/models/notification_option_row.dart';
import 'package:insurance_boost/pages/edit_profile_page.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey[800],
          ),
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(
        //       Icons.settings,
        //       color: Colors.grey[800],
        //     ),
        //     onPressed: () {
        //       Navigator.of(context).push(MaterialPageRoute(
        //           builder: (BuildContext context) => EditProfilePage()));
        //     },
        //   ),
        // ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Text(
              "Settings",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.grey[800],
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Account",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            // buildAccountOptionRow(context, "My Profile"),
            AccountOptionRow(
              title: 'My Profile',
              function: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => EditProfilePage())),
            ),
            buildAccountOptionRow(context, "Change password"),
            buildAccountOptionRow(context, "Language"),
            buildAccountOptionRow(context, "Privacy and security"),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Icon(
                  Icons.volume_up_outlined,
                  color: Colors.grey[800],
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Notifications",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            // buildNotificationOptionRow("New for you", globals.NOTE_DELIVER),
            // buildNotificationOptionRow("Night Mode", globals.NIGHT_MODE),
            NotificationOpetionRow(
              title: "New for you",
              isActive: globals.NOTE_DELIVER,
            ),
            NotificationOpetionRow(
              title: "Night Mode",
              isActive: globals.NIGHT_MODE,
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: RaisedButton(
                color: Colors.redAccent,
                elevation: 0,
                padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {},
                child: Text("SIGN OUT",
                    style: TextStyle(
                        fontSize: 16, letterSpacing: 2.2, color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }

  // GestureDetector buildNotificationOptionRow(String title, bool _isActive) {
  //   return GestureDetector(
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Text(
  //           title,
  //           style: TextStyle(
  //               fontSize: 18,
  //               fontWeight: FontWeight.w500,
  //               color: Colors.grey[600]),
  //         ),
  //         Transform.scale(
  //           scale: 0.7,
  //           child: CupertinoSwitch(
  //             activeColor: Colors.lightGreen[300],
  //             value: _isActive,
  //             onChanged: (bool value) => setState(() {
  //               _isActive = value;
  //               // print(_isActive);
  //               // print(globals.NIGHT_MODE);
  //             }),
  //           ),
  //         )
  //       ],
  //     ),
  //     // onTap: () {
  //     //   setState(() {
  //     //     isActive = !isActive;
  //     //     print(isActive);
  //     //   });
  //     // },
  //   );
  // }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Option 1"),
                    Text("Option 2"),
                    Text("Option 3"),
                  ],
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
