import 'package:flutter/material.dart';
import 'package:hydro_app/ui/ContentOfScreen/buttonScreenContent.dart';
import 'package:hydro_app/ui/general-widgets/button.dart';
import 'package:hydro_app/ui/general-widgets/roundedContainer.dart';
class ButtonScreen extends StatefulWidget {

  @override
  _ButtonScreenState createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return ButtonScreenContent();
  }
}
