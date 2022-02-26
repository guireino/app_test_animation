import 'dart:math';

import 'package:flutter/material.dart';

class slideListView extends StatefulWidget {
  final Widget? wiew1, wiew2;
  final String? defaultView;
  final Duration duration;
  // ignore: non_constant_identifier_names
  final Color ActionButtonColor;
  // ignore: non_constant_identifier_names
  final AnimatedIconData ActionButtionIcon;
  final bool enabledSwipe, showActionButton;

  const slideListView({
    Key? key,
    this.wiew1,
    this.wiew2,
    this.defaultView = "slides",
    this.duration = const Duration(milliseconds: 400),
    // ignore: non_constant_identifier_names
    this.ActionButtonColor = Colors.blue,
    // ignore: non_constant_identifier_names
    this.ActionButtionIcon = AnimatedIcons.view_list,
    this.enabledSwipe = false,
    this.showActionButton = true,
  }) : super(key: key);

  @override
  _slideListViewState createState() => _slideListViewState();
}

class _slideListViewState extends State<slideListView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  PageController _mainPageController = PageController();
  double currentPageValue = 0.0, _viewportFraction = 0.95;

  String currentView = "slides";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentPageValue = 0.0;
    _viewportFraction = 0.95;
    if (widget.defaultView == null) {
      currentView = "slides";
      //print("widget.defaultView if: " + currentView);
    } else if (widget.defaultView == true) {
      currentView = "list";
      //print("widget.defaultView else: " + currentView);
    }
    _mainPageController = PageController(initialPage: 0, viewportFraction: 1.0);
    _mainPageController.addListener(() {
      setState(() {
        currentPageValue = _mainPageController.page!;
      });
    });
    _animationController =
        AnimationController(vsync: this, duration: widget.duration);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            physics: widget.enabledSwipe
                ? const AlwaysScrollableScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            controller: _mainPageController,
            onPageChanged: (int newPage) {
              if (newPage == 0) {
                currentView = "slides";
              } else {
                currentView = "list";
              }
            },
            itemCount: 2,
            itemBuilder: (ctx, index) {
              if (index == 0) {
                return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.0005)
                    ..rotateY((currentPageValue - index) * sqrt(2)),
                  origin: currentPageValue <= index
                      ? const Offset(0, 0)
                      : Offset(
                          MediaQuery.of(ctx).size.width * _viewportFraction, 0),
                  child: widget.wiew1,
                );
              } else {
                return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.0005)
                    ..rotateY((currentPageValue - index) * sqrt(2)),
                  origin: currentPageValue <= index
                      ? const Offset(0, 0)
                      : Offset(
                          MediaQuery.of(ctx).size.width * _viewportFraction, 0),
                  child: widget.wiew2,
                );
              }
            },
          ),
          if (widget.showActionButton)
            Positioned(
              bottom: 8.0,
              right: 8.0,
              child: CircleAvatar(
                backgroundColor: widget.ActionButtonColor,
                child: IconButton(
                  icon: AnimatedIcon(
                    icon: widget.ActionButtionIcon,
                    progress: _animationController,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    //currentView = "slides";
                    if (currentView == "slides") {
                      //print("_currentView == $currentView");
                      _animationController.forward();

                      _mainPageController.animateToPage(1,
                          duration: widget.duration, curve: Curves.easeIn);

                      currentView = "list";
                    } else {
                      //print("_currentView == list");                      print("_currentView ==  $currentView");
                      _animationController.reverse();

                      _mainPageController.animateToPage(0,
                          duration: widget.duration, curve: Curves.easeIn);
                      currentView = "slides";
                    }
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
