import 'package:flutter/material.dart';
import 'package:ui_platform_design/widget/pressable_card_widget.dart';

class HeroAnimatedSongCard extends StatelessWidget {
  final String song;
  final Color color;
  final Animation<double> heroAnimation;
  final VoidCallback? onPressed;

  HeroAnimatedSongCard(
      {required this.song,
      required this.color,
      required this.heroAnimation,
      this.onPressed});

  double get playButtonSize => 50 + 50 * heroAnimation.value;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: heroAnimation,
      builder: (context, child) {
        return PressableCard(
          color: color,
          flattenAnimation: heroAnimation,
          onPressed: heroAnimation.value == 0 ? onPressed : null,
          child: SizedBox(
            height: 250,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: -80 * heroAnimation.value,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 80,
                    color: Colors.black12,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      song,
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: 45) * (1 - heroAnimation.value),
                  child: Container(
                    height: playButtonSize,
                    width: playButtonSize,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black12),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.play_arrow,
                      size: playButtonSize,
                      color: Colors.black38,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
