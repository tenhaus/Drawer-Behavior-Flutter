import 'dart:math';

import 'package:drawerbehavior_example/pages/drawer_3d.dart';
import 'package:drawerbehavior_example/pages/drawer_custom_item.dart';
import 'package:drawerbehavior_example/pages/drawer_custom_item_by_count.dart';
import 'package:drawerbehavior_example/pages/drawer_scale.dart';
import 'package:drawerbehavior_example/pages/drawer_scale_icon.dart';
import 'package:drawerbehavior_example/pages/drawer_scale_left_3d_right_slide_.dart';
import 'package:drawerbehavior_example/pages/drawer_scale_left_right.dart';
import 'package:drawerbehavior_example/pages/drawer_scale_left_right_inverse.dart';
import 'package:drawerbehavior_example/pages/drawer_scale_no_animation.dart';
import 'package:drawerbehavior_example/pages/drawer_scale_peek_left.dart';
import 'package:drawerbehavior_example/pages/drawer_scale_peek_right.dart';
import 'package:drawerbehavior_example/pages/drawer_scale_right.dart';
import 'package:drawerbehavior_example/pages/drawer_slide.dart';
import 'package:drawerbehavior_example/pages/drawer_slide_custom_appbar.dart';
import 'package:drawerbehavior_example/pages/drawer_slide_menu_slide.dart';
import 'package:drawerbehavior_example/pages/drawer_slide_with_footer.dart';
import 'package:drawerbehavior_example/pages/drawer_slide_with_header.dart';
import 'package:drawerbehavior_example/pages/drawer_with_child.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget createButton(context, {text, navigate, Color? color}) {
    Color buttonColor = color ?? Theme.of(context).primaryColor;
    return Container(
      margin: EdgeInsets.fromLTRB(12, 0, 12, 12),
      child: SizedBox(
          width: min(240, MediaQuery.of(context).size.width - 48),
          child: ElevatedButton(
              child: Text(
                text,
                textAlign: TextAlign.center,
              ),
              style: ElevatedButton.styleFrom(backgroundColor: buttonColor)
                  .copyWith(
                      foregroundColor: WidgetStateProperty.all(
                          ThemeData.estimateBrightnessForColor(buttonColor) ==
                                  Brightness.light
                              ? Colors.black
                              : Colors.white)),
              onPressed: () {
                Navigator.pushNamed(context, navigate);
              })),
    );
  }

  Widget home(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer Behavior"),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(16.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                createButton(context,
                    text: "Scale",
                    navigate: "/scale",
                    color: Theme.of(context).colorScheme.secondary),
                createButton(context,
                    text: "Scale - with Icon",
                    navigate: "/slide/scaleicon",
                    color: Theme.of(context).colorScheme.secondary),
                createButton(context,
                    text: "Scale - no animation",
                    navigate: "/scale/noanimation",
                    color: Theme.of(context).colorScheme.secondary),
                createButton(context,
                    text: "3D",
                    navigate: "/3d",
                    color: Theme.of(context).colorScheme.secondary),
                Divider(height: 16, color: Theme.of(context).dividerColor),
                Text("Align Top"),
                Divider(height: 16, color: Theme.of(context).dividerColor),
                createButton(context,
                    text: "Slide ",
                    navigate: "/slide",
                    color: Theme.of(context).colorScheme.secondary),
                createButton(context,
                    text: "Slide - Menu Slide ",
                    navigate: "/slide/menuslide",
                    color: Theme.of(context).colorScheme.secondary),
                createButton(context,
                    text: "Slide - with Header View",
                    navigate: "/slide/header",
                    color: Theme.of(context).colorScheme.secondary),
                createButton(context,
                    text: "Slide - with Footer View",
                    navigate: "/drawer8",
                    color: Theme.of(context).colorScheme.secondary),
                Divider(height: 16, color: Theme.of(context).dividerColor),
                Text("Duo Drawer"),
                Divider(height: 16, color: Theme.of(context).dividerColor),
                createButton(context,
                    text: "Left & Right",
                    navigate: "/duo/leftandright",
                    color: Theme.of(context).colorScheme.secondary),
                createButton(context,
                    text: "Left & Right (Inverse)",
                    navigate: "/duo/leftandright/inverse",
                    color: Theme.of(context).colorScheme.secondary),
                createButton(context,
                    text: "Left(3D) & Right(Slide)",
                    navigate: "/duo/left3dandrightslide",
                    color: Theme.of(context).colorScheme.secondary),
                createButton(context,
                    text: "Right",
                    navigate: "/duo/right",
                    color: Theme.of(context).colorScheme.secondary),
                Divider(height: 16, color: Theme.of(context).dividerColor),
                Text("Peek"),
                Divider(height: 16, color: Theme.of(context).dividerColor),
                createButton(context,
                    text: "Peek Left",
                    navigate: "/peek/duo/left",
                    color: Theme.of(context).colorScheme.secondary),
                createButton(context,
                    text: "Peek Right",
                    navigate: "/peek/duo/right",
                    color: Theme.of(context).colorScheme.secondary),
                Divider(height: 16, color: Theme.of(context).dividerColor),
                Text("Customize"),
                Divider(height: 16, color: Theme.of(context).dividerColor),
                createButton(context,
                    text: "Customize Item",
                    navigate: "/custom/item",
                    color: Theme.of(context).colorScheme.secondary),
                createButton(context,
                    text: "Customize Item by Count",
                    navigate: "/custom/item/count",
                    color: Theme.of(context).colorScheme.secondary),
                createButton(context,
                    text: "Custom AppBar",
                    navigate: "/custom/appbar",
                    color: Theme.of(context).colorScheme.secondary),
                createButton(context,
                    text: "Using child",
                    navigate: "/custom/withchild",
                    color: Theme.of(context).colorScheme.secondary),
              ],
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(primarySwatch: Colors.teal);
    return MaterialApp(
      theme: theme.copyWith(
          colorScheme:
              theme.colorScheme.copyWith(secondary: Colors.amberAccent)),
      routes: {
        "/": home,
        "/scale": (context) => createPage(DrawerScale()),
        "/scale/noanimation": (context) => createPage(DrawerScaleNoAnimation()),
        "/slide": (context) => createPage(DrawerSlide()),
        "/slide/menuslide": (context) => createPage(DrawerSlideMenuSlide()),
        "/slide/header": (context) => createPage(DrawerSlideWithHeader()),
        "/slide/scaleicon": (context) => createPage(DrawerScaleIcon()),
        "/duo/leftandright": (context) => createPage(DrawerLeftAndRight()),
        "/duo/right": (context) => createPage(DrawerRight()),
        "/duo/leftandright/inverse": (context) =>
            createPage(DrawerLeftAndRightInverse()),
        "/3d": (context) => createPage(Drawer3d()),
        "/duo/left3dandrightslide": (context) =>
            createPage(DrawerLeft3DAndRightSlide()),
        "/drawer8": (context) => createPage(DrawerSlideWithFooter()),
        "/peek/duo/left": (context) => createPage(DrawerPeekLeft()),
        "/peek/duo/right": (context) => createPage(DrawerPeekRight()),
        "/custom/appbar": (context) => createPage(DrawerSlideCustomAppBar()),
        "/custom/item": (context) => createPage(DrawerCustomItem()),
        "/custom/item/count": (context) =>
            createPage(DrawerCustomItemByCount()),
        "/custom/withchild": (context) => createPage(DrawerWithChild()),
      },
    );
  }

  Widget createPage(Widget child) {
    return Scaffold(
      appBar: AppBar(),
      body: child,
    );
  }
}
