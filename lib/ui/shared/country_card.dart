import 'package:country/constant/text_styles.dart';
import 'package:country/models/country/country.dart';
import 'package:country/providers/bookmark_provider.dart';
import 'package:country/ui/country_detail/country_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryCard extends ConsumerWidget {
  final Country? country;
  const CountryCard({
    Key? key,
    this.country,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final bookmarks = watch(bookMarkProvider);
    return Card(
      color: Color(0xfff1f1f1),
      margin: EdgeInsets.only(bottom: 16),
      child: ListTile(
        title: Text(
          country!.name!,
          style: kBodyTextStyle,
        ),
        dense: true,
        leading: Container(
          width: 64,
          child: Center(
            child: SvgPicture.network(
              country!.flag!,
              height: 24,
            ),
          ),
        ),
        subtitle: Text(country!.region!),
        minLeadingWidth: 0,
        // isThreeLine: true,
        trailing: IconButton(
          onPressed: () {
            context.read(bookMarkProvider).toggleBookmark(country!);
          },
          icon: Icon(Icons.bookmark),
          color: bookmarks.value.contains(country)
              ? Color(0xff6C63FF)
              : Colors.grey,
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CountryDetailScreen(country: country),
            ),
          );
        },
        minVerticalPadding: 16,
      ),
    );
  }
}
