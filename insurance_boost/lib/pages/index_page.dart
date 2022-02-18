import 'package:flutter/material.dart';
import 'package:insurance_boost/pages/home/home_page.dart';
import 'package:insurance_boost/pages/reward_page.dart';

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

  final pages = [
    HomePage(),
    DashBoardPage(),
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
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
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: Drawer(
        backgroundColor: Colors.white,
        //侧边栏按钮Drawer
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              //Material内置控件
              accountName: new Text(
                'CYC',
                style: TextStyle(fontSize: 20),
              ), //用户名
              accountEmail: new Text('example@126.com'), //用户邮箱
              currentAccountPicture: new GestureDetector(
                //用户头像
                onTap: () => print('current user'),
                child: new CircleAvatar(
                  //圆形图标控件
                  backgroundImage: new NetworkImage(
                      'https://upload.jianshu.io/users/upload_avatars/7700793/dbcf94ba-9e63-4fcf-aa77-361644dd5a87?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240'), //图片调取自网络
                ),
              ),
              decoration: new BoxDecoration(
                color: Colors.teal,
              ),
            ),
            new ListTile(
                //第二个功能项
                title: new Text('My Profile'),
                trailing: new Icon(Icons.person),
                onTap: () {}),
            new ListTile(
                //第二个功能项
                title: new Text('Settings'),
                trailing: new Icon(Icons.settings),
                onTap: () {}),
            new ListTile(
                //第二个功能项
                title: new Text('Reward'),
                trailing: new Icon(Icons.widgets_rounded),
                onTap: () {}),
            new ListTile(
                //第二个功能项
                title: new Text('Share this App'),
                trailing: new Icon(Icons.share),
                onTap: () {}),
            new Divider(), //分割线控件
          ],
        ),
      ),
    );
  }

  void _changePage(int index) {
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }
}
