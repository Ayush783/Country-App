import 'package:country/constant/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

InputDecoration? kInputDecoration(Size size) => InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: BorderSide(color: Colors.black),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: BorderSide(color: Color(0xff6C63FF), width: 2),
      ),
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 24.0),
        child: SvgPicture.asset(
          'assets/icons/search.svg',
          height: 24,
        ),
      ),
      hintStyle: kBodyTextStyle,
      suffixIconConstraints: BoxConstraints.loose(size),
      hintText: 'Enter country name or code',
    );
