import 'package:country/constant/text_styles.dart';
import 'package:country/providers/bookmark_provider.dart';
import 'package:country/ui/shared/country_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookmarkScreen extends ConsumerWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final bookmarks = watch(bookMarkProvider);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(
            size.width * 0.05,
            size.height * 0.05,
            size.width * 0.05,
            size.height * 0.05,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Bookmarks',
                  style: kheadingTextStyle,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: size.height * 0.05)),
              if (bookmarks.value.isEmpty)
                Container(
                  height: size.height * 0.5,
                  width: size.width,
                  child: Center(
                    child: Text('No bookmarks added'),
                  ),
                ),
              Expanded(
                  child: Container(
                child: ListView.builder(
                  itemCount: bookmarks.value.length,
                  itemBuilder: (context, index) => CountryCard(
                    country: bookmarks.value[index],
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
