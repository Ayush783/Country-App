//@dart=2.9
import 'package:country/blocs/download_bloc/download_bloc.dart';
import 'package:country/models/country/country.dart';
import 'package:country/ui/shared/bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DownloadButton extends StatefulWidget {
  final Country country;
  const DownloadButton({Key key, this.country}) : super(key: key);

  @override
  _DownloadButtonState createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<DownloadBloc, DownloadState>(
      listener: (context, state) {
        if (state is DownloadSuccess) {
          showModalBottomSheet(
            context: context,
            builder: (context) => Bottomsheet(
                text: '${widget.country.name}.txt saved successfuly',
                success: true),
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
                      .add(Download(widget.country, context));
                },
                icon: Icon(Icons.download));
          }
        },
      ),
    );
  }
}
