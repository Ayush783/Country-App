import 'package:country/constant/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryCard extends StatelessWidget {
  const CountryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xfff1f1f1),
      margin: EdgeInsets.only(bottom: 16),
      child: ListTile(
        title: Text(
          'United States of America',
          style: kBodyTextStyle,
        ),
        dense: true,
        leading: Container(
          width: 64,
          child: Center(
            child: SvgPicture.network(
              'https://restcountries.eu/data/umi.svg',
              height: 24,
            ),
          ),
        ),
        subtitle: Text('America'),
        minLeadingWidth: 0,
        // isThreeLine: true,
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.bookmark),
        ),
        minVerticalPadding: 16,
      ),
    );
  }
}
