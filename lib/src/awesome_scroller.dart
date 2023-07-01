import 'package:flutter/material.dart';

class AwesomeScroller extends StatefulWidget {
  const AwesomeScroller({required this.pageController,
    required this.itemCount, required this.widget,
    this.backgroundImageUrl = null,
    this.backgroundColor = null, this.progressIndicatorColor});

  int itemCount;
  PageController _pageController;
  String backgroundImageUrl;
  int backgroundColor, progressIndicatorColor;
  Widget widget;

  @override
  State<AwesomeScroller> createState() => _AwesomeScrollerState();
}

class _AwesomeScrollerState extends State<AwesomeScroller> {
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentPageValue = _pageController.page as double;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: blocGlobal!.viewModel!.deviceHeight,
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: itemCount,
        controller: _pageController,
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
                      child: widget.widget,
                    ),
                placeholder: (context, url) =>
                const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 100,
                    color: widget.progressIndicatorColor,
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

