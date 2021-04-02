import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_platform_design/cubit/song_cubit.dart';
import 'package:ui_platform_design/model/song.dart';
import 'package:ui_platform_design/utils.dart';
import 'package:ui_platform_design/widget/hero_animated_song_card_widget.dart';
import 'package:ui_platform_design/widget/platform_widget.dart';

class SongsTab extends StatefulWidget {
  static const title = 'Songs';
  static const androidIcon = Icon(Icons.music_note);
  static const iosIcon = Icon(CupertinoIcons.music_note);

  final Widget? androidDrawer;

  SongsTab({Key? key, this.androidDrawer}) : super(key: key);

  @override
  _SongsTabState createState() => _SongsTabState();
}

class _SongsTabState extends State<SongsTab> {

  final _androidRefreshKey = GlobalKey<RefreshIndicatorState>();


  void _togglePlatform() {
    TargetPlatform _getOppositePlatform() {
      if (defaultTargetPlatform == TargetPlatform.iOS) {
        return TargetPlatform.android;
      }
      return TargetPlatform.iOS;
    }
  }

  @override
  void initState() {
    _setData();
    super.initState();
  }

  void _setData() {
    //initialize Song
  }

  Future<void> _refreshData() {
    return Future.delayed(
        const Duration(seconds: 2), () => context.read<SongCubit>().refresh());
    /*return Future.delayed(
        const Duration(seconds: 2), () => setState(() => _setData()));*/
  }

  Widget _buildItemWidget(BuildContext context, int index) {
    if (index >= utils_song_length) {
      return Container(
        child: Text('Heyy'),
      );
    }

    return BlocBuilder<SongCubit, Song>(
        builder: (context, state){

          final color = defaultTargetPlatform == TargetPlatform.iOS
              ? state.colorList [index]
              : state.colorList[index].shade400;


          return SafeArea(
            top: false,
            bottom: false,
            child: Hero(
              tag: index,
              child: HeroAnimatedSongCard(
                song: state.songNameList[index],
                color: color,
                heroAnimation: ProxyAnimation(),
                onPressed: () => null,
              ),
            ),
          );
        });

  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SongsTab.title),
        actions: [
          IconButton(
              onPressed: () async =>
                  await _androidRefreshKey.currentState!.show(),
              icon: Icon(Icons.refresh)),
          IconButton(
            icon: Icon(Icons.shuffle),
            onPressed: _togglePlatform,
          )
        ],
      ),
      drawer: widget.androidDrawer,
      body: RefreshIndicator(
        key: _androidRefreshKey,
        onRefresh: _refreshData,
        child: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 12),
            itemCount: utils_song_length,
            itemBuilder: _buildItemWidget),
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Icon(CupertinoIcons.shuffle),
            onPressed: _togglePlatform,
          ),
        ),
        CupertinoSliverRefreshControl(
          onRefresh: _refreshData,
        ),
        SliverSafeArea(
          top: false,
          sliver: SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 12),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(_buildItemWidget,
                  childCount: utils_song_length),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(androidBuilder: _buildAndroid, iosBuilder: _buildIos);
  }
}
