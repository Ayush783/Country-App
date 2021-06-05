//@dart=2.9
import 'package:country/constant/text_styles.dart';
import 'package:country/providers/downloaded_files_provider.dart';
import 'package:country/repository/download/save_country_file_service.dart';
import 'package:country/repository/save/shared_pref_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FileCard extends ConsumerWidget {
  final String name;
  const FileCard({
    Key key,
    this.name,
  }) : super(key: key);

  static SharedPrefService spService = SharedPrefService();
  static SaveFileService _service = SaveFileService();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final downloads = watch(downloadedFilesProvider);
    return Card(
      color: Color(0xfff1f1f1),
      margin: EdgeInsets.only(bottom: 16),
      child: ListTile(
        title: Text(
          name,
          style: kBodyTextStyle,
        ),
        dense: true,
        trailing: IconButton(
          onPressed: () {
            _service.delete(name, context);
            spService.saveDownloads(downloads.value);
          },
          icon: Icon(Icons.delete),
          color: Colors.grey,
        ),
        minVerticalPadding: 16,
      ),
    );
  }
}
