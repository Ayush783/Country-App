//@dart=2.9
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:country/models/country/country.dart';
import 'package:country/models/failures/download_failure.dart';
import 'package:country/repository/download/save_country_file_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'download_event.dart';
part 'download_state.dart';

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  DownloadBloc() : super(DownloadInitial());

  final SaveFileService _saveFileService = SaveFileService();

  @override
  Stream<DownloadState> mapEventToState(
    DownloadEvent event,
  ) async* {
    if (event is Download) {
      yield Downloading();
      final unitOrFailure = await _saveFileService.saveFile(
          country: event.country, context: event.context);
      yield unitOrFailure.fold(
          (l) => DownloadFailed(l), (r) => DownloadSuccess());
    }
  }
}
