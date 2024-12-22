import 'package:flutter/material.dart';
import 'package:safe_paws_app/adoption_screen.dart';
import 'package:safe_paws_app/menu_screen.dart';
import 'package:safe_paws_app/login_screen.dart';

class MenuFrame extends StatefulWidget {

  @override
  State<MenuFrame> createState() => _MenuFrameState();
}

class _MenuFrameState extends State<MenuFrame> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> scaleAnimation;
  Duration duration = Duration(milliseconds: 200);
  bool menuOpen = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this,
        duration: duration);
    scaleAnimation = Tween<double>(begin: 1.0, end: 0.6).animate(_animationController);
  }

  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Stack(children: <Widget>[
      MenuScreen(),
      AnimatedPositioned(duration: duration,
        top: 0,
        bottom: 0,
        left: menuOpen ? deviceWidth * 0.55 : 0.0,
        right: menuOpen ? deviceWidth * -0.45 : 0.0,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: GestureDetector(onTap: (){
            if(menuOpen) {
              setState(() {
                menuOpen = false;
                _animationController.reverse();
              });
            }
          },
            child: AbsorbPointer(
              absorbing: menuOpen,
              child: Material(
                animationDuration: duration,
                borderRadius:
                BorderRadius.circular(
                    menuOpen ? 30.0 : 0.0),
                child: AdoptionScreen(
                  menuCallback: () {
                    setState(() {
                      menuOpen = true;
                      _animationController.forward();
                    });
                  },
                ),
              ),
            ),
          ),
        ),
      ),

    ],
    );
  }
}
