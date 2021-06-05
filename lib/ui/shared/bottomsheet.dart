import 'package:country/constant/text_styles.dart';
import 'package:flutter/material.dart';

class Bottomsheet extends StatelessWidget {
  final String? text;
  final bool? success;
  const Bottomsheet({Key? key, this.success, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: success! ? Colors.greenAccent : Colors.red,
      child: Text(
        text!,
        style: kBodyTextStyle!.copyWith(color: Colors.white),
      ),
    );
  }
}
