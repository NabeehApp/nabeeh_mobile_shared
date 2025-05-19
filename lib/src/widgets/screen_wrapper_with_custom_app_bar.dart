import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenWrapperWithCustomAppBar extends StatelessWidget {
  final Widget body;
  final String appBarTitle;
  final PreferredSizeWidget? bottom;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final GestureTapCallback onBackButtonTab;
  final bool isRTL;
  final TextStyle appBarStyle;

  const ScreenWrapperWithCustomAppBar({
    super.key,
    required this.body,
    required this.appBarTitle,
    this.bottom,
    this.actions,
    this.backgroundColor,
    required this.onBackButtonTab,
    required this.isRTL, required this.appBarStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFE6690F),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: const Color(0xFFE6690F),
            height: 130,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  top: -10,
                  left: -125,
                  height: 160.0,
                  width: 300.0,
                  child: Image.asset(
                    'assets/images/top.png',
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: AppBar(
                      title: Text(appBarTitle, style: appBarStyle),
                      bottom: bottom,
                      actions: actions,
                      centerTitle: true,
                      backgroundColor: Colors.transparent,
                      leading: GestureDetector(
                        behavior: HitTestBehavior.deferToChild,
                        onTap: onBackButtonTab,
                        child: RotatedBox(
                          quarterTurns: isRTL ? 0 : 2,
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/back.svg',
                              height: 20,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              padding: const EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                color: backgroundColor ?? Colors.white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  topLeft: Radius.circular(16),
                ),
              ),
              child: body,
            ),
          ),
        ],
      ),
    );
  }
}
