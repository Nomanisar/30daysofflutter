import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const imageUrl =
        "https://www.facebook.com/photo/?fbid=5321563321241961&set=a.109141109150901";
    return Drawer(
      backgroundColor: Colors.deepPurple,
      child: ListView(
        padding: EdgeInsets.zero,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                accountName: Text(
                  "Noman Nisar",
                  style: TextStyle(color: Colors.white),
                ),
                accountEmail: Text(
                  "nomanabloch9388@gmail.com",
                  style: TextStyle(color: Colors.white),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              )),
          const ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.white,
            ),
            title: Text(
              "Home",
              style: TextStyle(color: Colors.white),
              textScaleFactor: 1.2,
            ),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.white,
            ),
            title: Text(
              "Profile",
              style: TextStyle(color: Colors.white),
              textScaleFactor: 1.2,
            ),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.mail,
              color: Colors.white,
            ),
            title: Text(
              "Contact Me",
              style: TextStyle(color: Colors.white),
              textScaleFactor: 1.2,
            ),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.settings,
              color: Colors.white,
            ),
            title: Text(
              "Settings",
              style: TextStyle(color: Colors.white),
              textScaleFactor: 1.2,
            ),
          )
        ],
      ),
    );
  }
}
