import 'package:flutter/material.dart';
class TableScreenContent extends StatefulWidget {


  @override
  _TableScreenContentState createState() => _TableScreenContentState();
}

class _TableScreenContentState extends State<TableScreenContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Image.asset("images/table.png"),
      ),
    );
  }
}
