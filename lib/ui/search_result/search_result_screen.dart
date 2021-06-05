//@dart=2.9
import 'package:country/constant/text_styles.dart';
import 'package:country/models/country/country.dart';
import 'package:country/providers/seach_result_list_provider.dart';
import 'package:country/repository/sort/sort_list.dart';
import 'package:country/ui/shared/country_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchResultScreen extends StatefulWidget {
  final String query;
  final List<Country> countries;
  const SearchResultScreen({Key key, this.query, this.countries})
      : super(key: key);

  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  final SortCountries sortCountries = SortCountries();
  String _sortBy;

  @override
  void initState() {
    super.initState();
    context.read(searchResultListProvider).getList(widget.countries);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer(
      builder: (context, watch, child) {
        final resultlist = watch(searchResultListProvider);
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: EdgeInsets.fromLTRB(
                  size.width * 0.05, size.width * 0.05, size.width * 0.05, 0),
              child: Column(
                children: [
                  Text(
                    'Showing Results for \"${widget.query}\"',
                    style: kheadingTextStyle,
                  ),
                  Padding(padding: EdgeInsets.only(top: size.height * 0.1)),
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                        itemCount: resultlist.value.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => CountryCard(
                          country: resultlist.value[index],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => StatefulBuilder(
                    builder: (context, setState) => AlertDialog(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 24),
                      content: Container(
                        height: size.height * 0.15,
                        child: Column(
                          children: [
                            DropdownButton(
                              items: sortBy
                                  .map((e) => DropdownMenuItem(
                                        child: Text(e),
                                        value: e,
                                      ))
                                  .toList(),
                              hint: Text('Sort By'),
                              value: _sortBy,
                              style:
                                  kBodyTextStyle.copyWith(color: Colors.black),
                              onChanged: (value) {
                                _sortBy = value;
                                setState(() {});
                              },
                            ),
                            Padding(
                                padding:
                                    EdgeInsets.only(top: size.height * 0.01)),
                            ElevatedButton(
                                onPressed: () {
                                  switch (_sortBy) {
                                    case 'Name':
                                      sortCountries.sortByName(
                                          widget.countries, context);
                                      break;
                                    case 'Code':
                                      sortCountries.sortByCode(
                                          widget.countries, context);
                                      break;
                                    case 'Population':
                                      sortCountries.sortByPopulation(
                                          widget.countries, context);
                                      break;
                                    case 'Area':
                                      sortCountries.sortByArea(
                                          widget.countries, context);
                                      break;
                                    case 'Timezone':
                                      sortCountries.sortByTimezone(
                                          widget.countries, context);
                                      break;
                                    default:
                                  }
                                  Navigator.pop(context);
                                },
                                child: Text('Sort')),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              backgroundColor: Color(0xff6C63FF),
              child: Icon(Icons.filter_alt_rounded),
            ),
          ),
        );
      },
    );
  }
}

List<String> sortBy = ['Name', 'Code', 'Population', 'Area', 'Timezone'];
