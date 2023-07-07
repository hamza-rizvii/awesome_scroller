import 'dart:ui';

import 'package:flutter/material.dart';

class AwesomeScroller extends StatefulWidget {
  AwesomeScroller({
    required this.itemCount,
    required this.widget,
    required this.onPageChanged,
    this.scrollDirection = Axis.vertical,
    super.key,
  });

  final int itemCount;
  final Widget widget;
  final void Function(int)? onPageChanged;
  final Axis scrollDirection;

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
      height: MediaQuery.of(context).size.height,
      child: PageView.builder(
        scrollDirection: widget.scrollDirection,
        itemCount: widget.itemCount,
        controller: pageController,
        onPageChanged: widget.onPageChanged,
        itemBuilder: (context, index) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Transform(
                transform: Matrix4.identity()
                  ..rotateX(currentPageValue - index),
                child: widget.widget),
          );
        },
      ),
    );
  }
}
