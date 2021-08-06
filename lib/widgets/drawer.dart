import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class Mydrawer extends StatelessWidget {
  const Mydrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final ImageUrl =
        "https://animemotivation.com/wp-content/uploads/2020/07/itachi-uchiha-trees-anime-wallpaper-768x432.jpg";

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              accountName: Text(
                "Ankit Rana",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              accountEmail: Text(
                "ankitrana5000@gmail.com",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(ImageUrl, scale: 4),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.home,
              size: 32,
            ),
            title: Text(
              "Home",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              size: 32,
            ),
            title: Text(
              "Profile",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
