//@dart=2.9
import 'dart:io';

import 'package:country/models/country/country.dart';
import 'package:country/models/failures/download_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/cupertino.dart';

class SaveFileService {
  Future<Either<DownloadFailure, Unit>> saveFile(
      {@required Country country}) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final path = directory.path;
      if (await File('$path/${country.name}.txt').exists()) {
        return left(DownloadFailure('File already exists'));
      } else {
        final file = await File('$path/${country.name}.txt').create();
        file.writeAsString(
            'Country: ${country.name}\nCapital:${country.capital}\n');
      }
      return right(unit);
    } catch (e) {
      return left(DownloadFailure(e.toString()));
    }
  }
}
