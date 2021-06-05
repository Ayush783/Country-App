//@dart=2.9
import 'package:country/constant/text_styles.dart';
import 'package:country/repository/download/save_country_file_service.dart';
import 'package:country/repository/save/shared_pref_service.dart';
import 'package:flutter/material.dart';

class FileCard extends StatelessWidget {
  final String name;
  const FileCard({
    Key key,
    this.name,
  }) : super(key: key);

  static SharedPrefService spService = SharedPrefService();
  static SaveFileService _service = SaveFileService();

  @override
  Widget build(BuildContext context) {
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
          },
          icon: Icon(Icons.delete),
          color: Colors.grey,
        ),
        minVerticalPadding: 16,
      ),
    );
  }
}
