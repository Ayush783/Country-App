import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:country/models/country/country.dart';
import 'package:country/models/failures/search_failure.dart';
import 'package:country/repository/search/search_country.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial());

  final _searchService = SearchService();

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is SearchCountry) {
      yield Searching();
      List<Country> countries = List.empty(growable: true);
      //by name
      final countriesByNameOrFailure =
          await _searchService.getCountriesByName(name: event.query);
      if (countriesByNameOrFailure!.isLeft())
        yield countriesByNameOrFailure.fold(
            (l) => SearchFailed(l), (r) => null);
      countries.addAll(
        countriesByNameOrFailure.getOrElse(() => null),
      );
      //by code
      final countriesByCodeOrFailure =
          await _searchService.getCountriesByCode(code: event.query);
      if (countriesByCodeOrFailure!.isLeft())
        yield countriesByCodeOrFailure.fold(
            (l) => SearchFailed(l), (r) => null);
      countriesByCodeOrFailure.fold((l) => null, (r) {
        for (Country c in r) {
          if (!countries.contains(c)) countries.add(c);
        }
      });
      //by currency
      final countriesByCurrencyOrFailure =
          await _searchService.getCountriesByCurrency(currency: event.query);
      if (countriesByCurrencyOrFailure!.isLeft())
        yield countriesByCurrencyOrFailure.fold(
            (l) => SearchFailed(l), (r) => null);
      countriesByCurrencyOrFailure.fold((l) => null, (r) {
        for (Country c in r) {
          if (!countries.contains(c)) countries.add(c);
        }
      });
      //by Language
      final countriesByLanguageOrFailure =
          await _searchService.getCountriesByLanguage(lang: event.query);
      if (countriesByLanguageOrFailure!.isLeft())
        yield countriesByLanguageOrFailure.fold(
            (l) => SearchFailed(l), (r) => null);
      countriesByLanguageOrFailure.fold((l) => null, (r) {
        for (Country c in r) {
          if (!countries.contains(c)) countries.add(c);
        }
      });
      //by region
      final countriesByRegionOrFailure =
          await _searchService.getCountriesByRegion(region: event.query);
      if (countriesByRegionOrFailure!.isLeft())
        yield countriesByRegionOrFailure.fold(
            (l) => SearchFailed(l), (r) => null);
      countriesByRegionOrFailure.fold((l) => null, (r) {
        for (Country c in r) {
          if (!countries.contains(c)) countries.add(c);
        }
      });
      //by capital
      final countriesByCapitalOrFailure =
          await _searchService.getCountriesByCapital(capital: event.query);
      if (countriesByCapitalOrFailure!.isLeft())
        yield countriesByCapitalOrFailure.fold(
            (l) => SearchFailed(l), (r) => null);
      countriesByCapitalOrFailure.fold((l) => null, (r) {
        for (Country c in r) {
          if (!countries.contains(c)) countries.add(c);
        }
      });
    }
  }
}
