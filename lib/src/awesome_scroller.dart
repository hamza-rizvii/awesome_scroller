import 'dart:ui';

import 'package:flutter/material.dart';

class AwesomeScroller extends StatefulWidget {
  const AwesomeScroller({required this.itemCount,
    required this.widget,
    super.key});

  final int itemCount;
  final Widget widget;

  @override
  State<AwesomeScroller> createState() => _AwesomeScrollerState();
}

class _AwesomeScrollerState extends State<AwesomeScroller> {
  var currentPageValue = 0.0;
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPageValue = pageController.page as double;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery
          .of(context)
          .size
          .height,
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.itemCount,
        controller: pageController,
        itemBuilder: (context, index) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Transform(
                transform: Matrix4.identity()
                  ..rotateX(currentPageValue - index),
                child: widget.widget
            ),
          );
        },
      ),
    );
  }
}
