import 'package:flutter/material.dart';

class DisplayNewsUI extends StatefulWidget {
  @override
  _DisplayNewsUIState createState() => _DisplayNewsUIState();
}

class _DisplayNewsUIState extends State<DisplayNewsUI> {
  Widget mobileView() {
    return Scaffold();
  }

  Widget desktopView() {
    return Scaffold();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 480) {
          return mobileView();
        } else
          return desktopView();
      },
    );
  }
}
