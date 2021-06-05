//@dart=2.9
import 'package:country/blocs/download_bloc/download_bloc.dart';
import 'package:country/models/country/country.dart';
import 'package:country/ui/download/download_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DownloadProvider extends StatelessWidget {
  final Country country;
  const DownloadProvider({Key key, this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DownloadBloc>(
      create: (context) => DownloadBloc(),
      child: DownloadButton(
        country: country,
      ),
    );
  }
}
