import 'package:country/models/country/country.dart';
import 'package:country/providers/seach_result_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SortCountries {
  void sortByName(List<Country> countries, BuildContext context) {
    print(countries[0].name);
    countries.sort((a, b) => a.name!.compareTo(b.name!));
    print(countries[0].name);
    context.read(searchResultListProvider).getList(countries);
  }

  void sortByCode(List<Country> countries, BuildContext context) {
    print(countries[0].alpha2Code);
    countries.sort((a, b) => a.alpha2Code!.compareTo(b.alpha2Code!));
    print(countries[0].alpha2Code);
    context.read(searchResultListProvider).getList(countries);
  }

  void sortByPopulation(List<Country> countries, BuildContext context) {
    print(countries[0].population);
    countries.sort((a, b) => a.population!.compareTo(b.population!));
    print(countries[0].population);
    context.read(searchResultListProvider).getList(countries);
  }

  void sortByArea(List<Country> countries, BuildContext context) {
    print(countries[0].area);
    countries.sort((a, b) => a.area!.compareTo(b.area ?? 0));
    print(countries[0].area);
    context.read(searchResultListProvider).getList(countries);
  }
}
