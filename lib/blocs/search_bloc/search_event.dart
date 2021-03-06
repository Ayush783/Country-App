//@dart=2.9
part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchCountry extends SearchEvent {
  final String query, searchBy;

  SearchCountry(this.query, this.searchBy);
}
