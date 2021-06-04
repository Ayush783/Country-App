part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class Searching extends SearchState {}

class SearchSuccess extends SearchState {
  final List<Country> countries;

  SearchSuccess(this.countries);
}

class SearchFailed extends SearchState {
  final SearchFailure failure;

  SearchFailed(this.failure);
}
