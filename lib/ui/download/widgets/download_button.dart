//@dart=2.9
import 'package:country/blocs/download_bloc/download_bloc.dart';
import 'package:country/models/country/country.dart';
import 'package:country/providers/downloaded_files_provider.dart';
import 'package:country/repository/save/shared_pref_service.dart';
import 'package:country/ui/shared/bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DownloadButton extends ConsumerWidget {
  final Country country;
  const DownloadButton({Key key, this.country}) : super(key: key);

  static SharedPrefService spService = SharedPrefService();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final downloads = watch(downloadedFilesProvider);
    return BlocListener<DownloadBloc, DownloadState>(
      listener: (context, state) {
        if (state is DownloadSuccess) {
          spService.saveDownloads(downloads.value);
          showModalBottomSheet(
            context: context,
            builder: (context) => Bottomsheet(
                text: '${country.name}.txt saved successfuly', success: true),
          );
        }
        if (state is DownloadFailed)
          showModalBottomSheet(
            context: context,
            builder: (context) =>
                Bottomsheet(text: state.failure.error, success: false),
          );
      },
      child: BlocBuilder<DownloadBloc, DownloadState>(
        builder: (context, state) {
          if (state is Downloading) {
            return Container(
                padding: EdgeInsets.all(4),
                child: CircularProgressIndicator(
                  color: Colors.black,
                  strokeWidth: 2.5,
                ));
          } else if (state is DownloadSuccess) {
            return IconButton(
                onPressed: () {}, icon: Icon(Icons.download_done));
          } else {
            return IconButton(
                onPressed: () {
                  BlocProvider.of<DownloadBloc>(context)
                      .add(Download(country, context));
                },
                icon: Icon(Icons.download));
          }
        },
      ),
    );
  }
}
