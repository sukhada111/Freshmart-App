import 'package:flutter/material.dart';

import '../constants.dart';

class flatButton extends StatelessWidget {
  final Function onTap;
  final String buttonTitle;

  flatButton({@required this.onTap, @required this.buttonTitle});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: FlatContColor,
        margin: EdgeInsets.only(top: 10.0),
        height: FlatContHeight,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(130, 25, 130, 25),
          child: Text(buttonTitle,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
