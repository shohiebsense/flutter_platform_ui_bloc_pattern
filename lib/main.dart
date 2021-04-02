import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_platform_design/app_observer.dart';
import 'package:ui_platform_design/playlist_app.dart';

void main() {
  Bloc.observer = AppObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PlaylistApp();
  }
}
