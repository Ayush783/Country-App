//@dart=2.9
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

      switch (event.searchBy) {
        case 'Name':
          final countriesByNameOrFailure =
              await _searchService.getCountriesByName(name: event.query);
          yield countriesByNameOrFailure.fold(
            (l) => SearchFailed(l),
            (r) => SearchSuccess(r),
          );
          break;
        case 'Code':
          final countriesByCodeOrFailure =
              await _searchService.getCountriesByCode(code: event.query);
          yield countriesByCodeOrFailure.fold(
            (l) => SearchFailed(l),
            (r) => SearchSuccess(r),
          );
          break;
        case 'Region':
          final countriesByRegionOrFailure =
              await _searchService.getCountriesByRegion(region: event.query);
          yield countriesByRegionOrFailure.fold(
            (l) => SearchFailed(l),
            (r) => SearchSuccess(r),
          );
          break;
        case 'Language':
          final countriesByLanguageOrFailure =
              await _searchService.getCountriesByLanguage(lang: event.query);
          yield countriesByLanguageOrFailure.fold(
            (l) => SearchFailed(l),
            (r) => SearchSuccess(r),
          );
          break;
        case 'Capital':
          final countriesByCapitalOrFailure =
              await _searchService.getCountriesByCapital(capital: event.query);
          yield countriesByCapitalOrFailure.fold(
            (l) => SearchFailed(l),
            (r) => SearchSuccess(r),
          );
          break;
        // case 'Currency':
        //   final countriesByCurrencyOrFailure = await _searchService
        //       .getCountriesByCurrency(currency: event.query);
        //   yield countriesByCurrencyOrFailure.fold(
        //     (l) => SearchFailed(l),
        //     (r) => SearchSuccess(r),
        //   );
        //   break;
        default:
          yield SearchFailed(
            SearchFailure('Something went wrong!'),
          );
      }
    }
  }
}
