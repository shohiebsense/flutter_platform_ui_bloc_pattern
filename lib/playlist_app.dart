import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_platform_design/page/home_page.dart';
import 'package:ui_platform_design/page/infinity_list_page.dart';

class PlaylistApp extends MaterialApp {
  PlaylistApp({Key? key})
      : super(
            debugShowCheckedModeBanner: false,
            key: key,
            theme: ThemeData(
              primarySwatch: Colors.red,
            ),
            builder: (context, child) {
              return CupertinoTheme(
                data: CupertinoThemeData(),
                child: Material(child: child),
              );
            },
            home: const InfinityListPage());
}
