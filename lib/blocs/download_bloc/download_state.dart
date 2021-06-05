//@dart=2.9
part of 'download_bloc.dart';

@immutable
abstract class DownloadState {}

class DownloadInitial extends DownloadState {}

class Downloading extends DownloadState {}

class DownloadSuccess extends DownloadState {}

class DownloadFailed extends DownloadState {
  final DownloadFailure failure;

  DownloadFailed(this.failure);
}
