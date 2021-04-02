import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_platform_design/cubit/song_cubit.dart';
import 'package:ui_platform_design/tab/songs_tab.dart';
import 'package:ui_platform_design/widget/android_drawer.dart';
import 'package:ui_platform_design/widget/platform_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final songsTabKey = GlobalKey();

  Widget _buildIosHomepage(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [

        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              defaultTitle: 'SonsTab.title',
              //builder: (context) => SongsTab(key: songsTabKey),
            );
          default:
            return SizedBox.shrink();
        }
      },
    );
  }

  Widget _buildAndroidHomePage(BuildContext context){
    return BlocProvider(
      create: (_) => SongCubit(),
      child: SongsTab(
        key: songsTabKey,
        androidDrawer: AndroidDrawer(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
        iosBuilder: _buildIosHomepage, androidBuilder: _buildAndroidHomePage);
  }
}
