//@dart=2.9
import 'package:country/providers/show_buttons.dart';
import 'package:country/ui/bookmarks/bookmark_screen.dart';
import 'package:country/ui/download/download_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreenButtons extends ConsumerWidget {
  const HomeScreenButtons({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final showButtons = watch(showButtonsProvider);
    return Positioned(
      right: 12,
      bottom: size.height * 0.1,
      child: AnimatedOpacity(
        opacity: showButtons.value ? 1 : 0,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
        child: Column(
          children: [
            //saved button
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BookmarkScreen(),
                  ),
                );
              },
              child: Icon(Icons.bookmark),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                fixedSize: Size(56, 56),
                padding: EdgeInsets.zero,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 8)),
            //favourites button
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DownloadsScreen(),
                  ),
                );
              },
              child: Icon(Icons.download),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                fixedSize: Size(56, 56),
                padding: EdgeInsets.zero,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
