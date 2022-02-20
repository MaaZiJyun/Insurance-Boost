import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:insurance_boost/models/user.dart';
import 'package:insurance_boost/pages/home/home_page.dart';
import 'package:insurance_boost/pages/reward_page.dart';
import 'package:insurance_boost/pages/submit_form_page.dart';
import 'package:share_plus/share_plus.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      backgroundColor: Colors.white,
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.white,
      icon: Icon(Icons.widgets_rounded),
      label: 'Reward',
    ),
  ];

  late int currentIndex;

  late Person me;

  final pages = [
    HomePage(),
    DashBoardPage(),
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    getUser();
  }

  Future<void> getUser() async {
    // await FirebaseAuth.instance.signOut();
    int i = 0;
    bool error = true;
    while (i < 5) {
      try {
        await FirebaseFirestore.instance
            .collection('user')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get()
            .then((doc) {
          me = Person(FirebaseAuth.instance.currentUser!.uid, doc['username'],
              doc['email'], doc['profileUrl'], doc['bio'], doc['point']);
        });
        error = false;
      } catch (e) {
        print(e);
        // initState();
        // await FirebaseAuth.instance.signOut();
        error = true;
      }
      i++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(
            child: SpinKitRing(
              color: Colors.teal,
              size: 80.0,
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text(
              'W & M',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/SettingsPage');
                },
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.teal,
            unselectedItemColor: Colors.grey,
            items: bottomNavItems,
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              _changePage(index);
            },
          ),
          body: pages[currentIndex],
          floatingActionButton: FloatingActionButton(
            backgroundColor: currentIndex == 0 ? Colors.teal : Colors.grey,
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SubmitFormPage(),
                ),
              );
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          drawer: Drawer(
            backgroundColor: Colors.white,
            //侧边栏按钮Drawer
            child: new ListView(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  //Material内置控件
                  accountName: new Text(
                    me.username,
                    style: TextStyle(fontSize: 20),
                  ), //用户名
                  accountEmail: new Text(me.email), //用户邮箱
                  currentAccountPicture: new GestureDetector(
                    //用户头像
                    onTap: () {
                      Navigator.pushNamed(context, '/EditProfilePage')
                          .then((value) => _getRequists());
                    },
                    child: new CircleAvatar(
                      //圆形图标控件
                      backgroundImage:
                          new NetworkImage(me.profileUrl), //图片调取自网络
                    ),
                  ),
                  decoration: new BoxDecoration(
                    color: Colors.teal,
                  ),
                ),
                new ListTile(
                    title: new Text('My Profile'),
                    trailing: new Icon(Icons.person),
                    onTap: () {
                      Navigator.pushNamed(context, '/EditProfilePage');
                    }),
                new ListTile(
                    title: new Text('Settings'),
                    trailing: new Icon(Icons.settings),
                    onTap: () {
                      Navigator.pushNamed(context, '/SettingsPage');
                    }),
                new ListTile(
                    title: new Text('Share this App'),
                    trailing: new Icon(Icons.share),
                    onTap: () async {
                      final urlPreview =
                          'https://www.youtube.com/watch?v=CNUBhb_cM6E&t=11s';
                      await Share.share(
                          'This is the link for download our app:\n\n$urlPreview');
                    }),
                new ListTile(
                    title: new Text('About Us'),
                    trailing: new Icon(Icons.group),
                    onTap: () {
                      Navigator.pushNamed(context, '/AboutPage');
                    }),
                new Divider(), //分割线控件
              ],
            ),
          ),
        );
      },
    );
  }

  void _changePage(int index) {
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }

  _getRequists() {
    setState(() {});
  }
}
