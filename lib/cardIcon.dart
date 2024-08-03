import 'package:flutter/material.dart';
import 'constant.dart';
class cardIcon extends StatelessWidget {
  cardIcon({required this.Cicon, required this.Ctext});

  final IconData Cicon;
  final String Ctext;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Cicon,
          size: 80.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          Ctext,
          style: kTextStyle,
        )
      ],
    );
  }
}
