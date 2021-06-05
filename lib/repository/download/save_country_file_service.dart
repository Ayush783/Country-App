//@dart=2.9
import 'dart:io';

import 'package:country/models/country/country.dart';
import 'package:country/models/failures/download_failure.dart';
import 'package:country/providers/downloaded_files_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

class SaveFileService {
  Future<Either<DownloadFailure, Unit>> saveFile(
      {@required Country country, BuildContext context}) async {
    try {
      var status = await Permission.storage.status;
      if (!status.isGranted) {
        await Permission.storage.request();
      }
      Directory tempDir = await DownloadsPathProvider.downloadsDirectory;
      String tempPath = tempDir.path;
      if (await File('$tempPath/${country.name}.txt').exists()) {
        return left(DownloadFailure('File already exists'));
      } else {
        final file = await File('$tempPath/${country.name}.txt').create();
        file.writeAsString(
            'Country: ${country.name}\nCapital:${country.capital}\n');
        context.read(downloadedFilesProvider).addFile(country.name);
      }
      return right(unit);
    } catch (e) {
      print(e);
      return left(DownloadFailure(e.toString()));
    }
  }

  Future<void> delete(String name, BuildContext context) async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    Directory tempDir = await DownloadsPathProvider.downloadsDirectory;
    String tempPath = tempDir.path;
    final file = File('$tempPath/$name.txt');
    await file.delete();
    context.read(downloadedFilesProvider).delete(name);
  }
}
