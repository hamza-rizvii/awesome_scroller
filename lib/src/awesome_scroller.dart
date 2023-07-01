import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AwesomeScroller extends StatefulWidget {
  const AwesomeScroller({required this.pageController,
    required this.itemCount, required this.widget,
    this.backgroundImageUrl = "https://images.pexels.com/photos/16539417/pexels-photo-16539417/free-photo-of-aire.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    this.progressIndicatorColor = 0xff777777, super.key});

  final int itemCount;
  final PageController pageController;
  final String backgroundImageUrl;
  final int progressIndicatorColor;
  final List<Widget> widget;

  @override
  State<AwesomeScroller> createState() => _AwesomeScrollerState();
}

class _AwesomeScrollerState extends State<AwesomeScroller> {
  var currentPageValue = 0.0;
  @override
  void initState() {
    super.initState();
    widget.pageController.addListener(() {
      setState(() {
        currentPageValue = widget.pageController.page as double;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.itemCount,
        controller: widget.pageController,
        itemBuilder: (context, index) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Transform(
              transform: Matrix4.identity()
                ..rotateX(currentPageValue - index),
              child: CachedNetworkImage(
                imageUrl: widget.backgroundImageUrl,
                imageBuilder: (context, provider) =>
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: provider, fit: BoxFit.cover, opacity: 0.7),
                      ),
                      child: widget,
                    ),
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 100,
                    color: Color(widget.progressIndicatorColor),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          );
        },
      ),
    );
  }
}
