import 'package:flutter/material.dart';
import 'package:implicit_animations_sample/screens/animated_align_screen.dart';
import 'package:implicit_animations_sample/screens/animated_container_screen.dart';
import 'package:implicit_animations_sample/screens/animated_cross_fade_screen.dart';
import 'package:implicit_animations_sample/screens/animated_default_text_style_screen.dart';
import 'package:implicit_animations_sample/screens/animated_opacity_screen.dart';
import 'package:implicit_animations_sample/screens/animated_padding_screen.dart';
import 'package:implicit_animations_sample/screens/animated_physical_model_screen.dart';
import 'package:implicit_animations_sample/screens/animated_positioned_directional.dart';
import 'package:implicit_animations_sample/screens/animated_positioned_screen.dart';
import 'package:implicit_animations_sample/screens/animated_size_screen.dart';
import 'package:implicit_animations_sample/screens/animated_switcher_screen.dart';
import 'package:implicit_animations_sample/screens/animated_theme_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final ThemeData _lightTheme = ThemeData(
      primaryColor: Colors.blue,
      accentColor: Colors.blue,
      textTheme: TextTheme(bodyText2: TextStyle(color: Colors.black)));

  static final ThemeData _darkTheme = ThemeData(
      primaryColor: Colors.blue,
      accentColor: Colors.black,
      textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: _lightTheme,
      darkTheme: _darkTheme,
      home: AnimationSampleList(),
    );
  }
}

class AnimationSampleList extends StatelessWidget {
  List<Widget> _list(BuildContext context) {
    return [
      AnimationSampleListItem(
          itemName: 'AnimatedContainer',
          onPressItem: () {
            this._navigator(context, AnimatedContainerScreen());
          }),
      AnimationSampleListItem(
          itemName: 'AnimatedAlign',
          onPressItem: () {
            this._navigator(context, AnimatedAlignScreen());
          }),
      AnimationSampleListItem(
          itemName: 'AnimatedDefaultTestStyle',
          onPressItem: () {
            this._navigator(context, AnimatedDefaultTestStyleScreen());
          }),
      AnimationSampleListItem(
          itemName: 'AnimatedOpacity',
          onPressItem: () {
            this._navigator(context, AnimatedOpacityScreen());
          }),
      AnimationSampleListItem(
          itemName: 'AnimatedPadding',
          onPressItem: () {
            this._navigator(context, AnimatedPaddingScreen());
          }),
      AnimationSampleListItem(
          itemName: 'AnimatedPhysicalModel',
          onPressItem: () {
            this._navigator(context, AnimatedPhysicalModelScreen());
          }),
      AnimationSampleListItem(
          itemName: 'AnimatedPositioned',
          onPressItem: () {
            this._navigator(context, AnimatedPositionedScreen());
          }),
      AnimationSampleListItem(
          itemName: 'AnimatedPositionedDirectional',
          onPressItem: () {
            this._navigator(context, AnimatedPositionedDirectionalScreen());
          }),
      AnimationSampleListItem(
          itemName: 'AnimatedTheme',
          onPressItem: () {
            this._navigator(context, AnimatedThemeScreen());
          }),
      AnimationSampleListItem(
          itemName: 'AnimatedCrossFade',
          onPressItem: () {
            this._navigator(context, AnimatedCrossFadeScreen());
          }),
      AnimationSampleListItem(
          itemName: 'AnimatedSize',
          onPressItem: () {
            this._navigator(context, AnimatedSizeScreen());
          }),
      AnimationSampleListItem(
          itemName: 'AnimatedSwitcher',
          onPressItem: () {
            this._navigator(context, AnimatedSwitcherScreen());
          }),
    ];
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = _list(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Implicit Animations Sample'),
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return list[index];
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(color: Colors.black);
          },
          itemCount: list.length),
    );
  }

  void _navigator(BuildContext context, Widget nextScreen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return nextScreen;
    }));
  }
}

class AnimationSampleListItem extends StatelessWidget {
  final String itemName;
  final Function onPressItem;

  AnimationSampleListItem(
      {@required this.itemName, @required this.onPressItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Text(
          this.itemName,
          style: TextStyle(fontSize: 20),
        ),
      ),
      onTap: this.onPressItem,
    );
  }
}
