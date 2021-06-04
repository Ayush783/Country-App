import 'package:country/constant/textfield_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: size.height * 0.22)),
              SvgPicture.asset(
                'assets/images/image1.svg',
                width: size.width * 0.5,
              ),
              Padding(padding: EdgeInsets.only(top: size.height * 0.1)),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(2, 2),
                        color: Colors.grey,
                        blurRadius: 2,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(32)),
                child: TextField(
                  decoration: kInputDecoration(size),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: size.height * 0.1)),
              ElevatedButton(
                onPressed: () {},
                child: Text('Search'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
