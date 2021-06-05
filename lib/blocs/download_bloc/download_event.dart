//@dart=2.9
part of 'download_bloc.dart';

@immutable
abstract class DownloadEvent {}

class Download extends DownloadEvent {
  final Country country;

  Download(this.country);
}
