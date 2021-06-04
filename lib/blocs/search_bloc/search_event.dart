//@dart=2.9
part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchCountry extends SearchEvent {
  final String query;

  SearchCountry(this.query);
}
