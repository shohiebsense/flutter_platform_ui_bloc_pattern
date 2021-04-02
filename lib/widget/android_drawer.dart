

import 'package:flutter/material.dart';
import 'package:ui_platform_design/tab/songs_tab.dart';

class AndroidDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Icon(
                  Icons.account_circle,
                  color: Colors.green.shade800,
                  size: 96,
                ),
              )
          ),
          ListTile(
            leading: SongsTab.androidIcon,
            title: Text(SongsTab.title),
            onTap: (){
              Navigator.pop(context);
            },
          ),

        ],
      ),
    );
  }
}
