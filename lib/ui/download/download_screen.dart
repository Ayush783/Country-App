//@dart=2.9
import 'package:country/constant/text_styles.dart';
import 'package:country/providers/downloaded_files_provider.dart';
import 'package:country/ui/download/widgets/file_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DownloadsScreen extends ConsumerWidget {
  const DownloadsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final downloads = watch(downloadedFilesProvider);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(size.width * 0.05, size.height * 0.05,
              size.width * 0.05, size.height * 0.05),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Downloads',
                  style: kheadingTextStyle,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: size.height * 0.05)),
              if (downloads.value.isEmpty)
                Container(
                  height: size.height * 0.5,
                  width: size.width,
                  child: Center(
                    child: Text('No downloads yet'),
                  ),
                ),
              Container(
                child: ListView.builder(
                  itemCount: downloads.value.length,
                  itemBuilder: (context, index) => FileCard(
                    name: downloads.value[index],
                  ),
                  shrinkWrap: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
