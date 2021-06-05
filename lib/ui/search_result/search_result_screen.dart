//@dart=2.9
import 'package:country/constant/text_styles.dart';
import 'package:country/models/country/country.dart';
import 'package:country/ui/shared/country_card.dart';
import 'package:flutter/material.dart';

class SearchResultScreen extends StatelessWidget {
  final String query;
  final List<Country> countries;
  const SearchResultScreen({Key key, this.query, this.countries})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            size.width * 0.05, size.width * 0.05, size.width * 0.05, 0),
        child: Column(
          children: [
            Text(
              'Showing Results for \"$query\"',
              style: kheadingTextStyle,
            ),
            Padding(padding: EdgeInsets.only(top: size.height * 0.1)),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: countries.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => CountryCard(
                    country: countries[index],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
