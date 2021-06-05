//@dart=2.9
import 'package:country/constant/text_styles.dart';
import 'package:country/models/country/country.dart';
import 'package:country/providers/bookmark_provider.dart';
import 'package:country/repository/save/shared_pref_service.dart';
import 'package:country/ui/download/widgets/download_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryDetailScreen extends ConsumerWidget {
  final Country country;
  const CountryDetailScreen({Key key, this.country}) : super(key: key);

  static SharedPrefService spService = SharedPrefService();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final bookmarks = watch(bookMarkProvider);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(size.width * 0.05, size.height * 0.05,
              size.width * 0.05, size.height * 0.05),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: size.width,
                ),
                SvgPicture.network(
                  country.flag,
                  height: size.height * 0.15,
                ),
                Padding(padding: EdgeInsets.only(top: size.height * 0.03)),
                Text(
                  country.name,
                  style: kheadingTextStyle.copyWith(color: Color(0xff6C63FF)),
                ),
                Padding(padding: EdgeInsets.only(top: size.height * 0.01)),
                Text(
                  country.region + ' / ' + country.subregion,
                  style: kBodyTextStyle,
                ),
                Padding(padding: EdgeInsets.only(top: size.height * 0.01)),
                Text(
                  'latitude:  ' + country.latlng[0].toString(),
                  style: kBodyTextStyle,
                ),
                Text(
                  'longitude:  ' + country.latlng[1].toString(),
                  style: kBodyTextStyle,
                ),
                Padding(padding: EdgeInsets.only(top: size.height * 0.02)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.read(bookMarkProvider).toggleBookmark(country);
                        spService.saveBookmarks(bookmarks.value);
                      },
                      icon: Icon(
                        Icons.bookmark,
                      ),
                      color: bookmarks.value
                              .any((element) => element.name == country.name)
                          ? Color(0xff6C63FF)
                          : Colors.grey,
                    ),
                    Padding(padding: EdgeInsets.only(right: 16)),
                    DownloadProvider(
                      country: country,
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: size.height * 0.02)),
                //country stat container
                Container(
                  width: size.width,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Color(0xfff1f1f1),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(offset: Offset(1, 1), color: Colors.grey)
                      ]),
                  child: Column(
                    children: [
                      Text(
                        'Country Stats',
                        style: kheadingTextStyle,
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: size.height * 0.01)),
                      Row(
                        children: [
                          Text(
                            'Capital City -',
                            style: kBodyTextStyle,
                          ),
                          Spacer(),
                          Text(
                            country.capital,
                            style: kBodyTextStyle.copyWith(
                                color: Colors.blue[900]),
                          )
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: size.height * 0.01)),
                      Row(
                        children: [
                          Text(
                            'Population -',
                            style: kBodyTextStyle,
                          ),
                          Spacer(),
                          Text(
                            country.population.toString(),
                            style: kBodyTextStyle.copyWith(
                                color: Colors.blue[900]),
                          )
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: size.height * 0.01)),
                      Row(
                        children: [
                          Text(
                            'Area -',
                            style: kBodyTextStyle,
                          ),
                          Spacer(),
                          Text(
                            country.area.toString() + ' km²',
                            style: kBodyTextStyle.copyWith(
                                color: Colors.blue[900]),
                          )
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: size.height * 0.01)),
                      Row(
                        children: [
                          Text(
                            'Native name -',
                            style: kBodyTextStyle,
                          ),
                          Spacer(),
                          Text(
                            country.nativeName,
                            style: kBodyTextStyle.copyWith(
                                color: Colors.blue[900]),
                          )
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: size.height * 0.01)),
                      Row(
                        children: [
                          Text(
                            'Country codes -',
                            style: kBodyTextStyle,
                          ),
                          Spacer(),
                          Text(
                            country.alpha2Code + ' / ' + country.alpha3Code,
                            style: kBodyTextStyle.copyWith(
                                color: Colors.blue[900]),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: size.height * 0.03)),
                //calling codes
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xfff1f1f1),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(offset: Offset(1, 1), color: Colors.grey)
                      ]),
                  child: ExpansionTile(
                    title: Text('Calling Codes'),
                    children: [
                      for (String code in country.callingCodes)
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            '+' + code,
                            style: kBodyTextStyle,
                          ),
                        ),
                      Padding(
                          padding: EdgeInsets.only(top: size.height * 0.01)),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: size.height * 0.03)),
                //calling codes
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xfff1f1f1),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(offset: Offset(1, 1), color: Colors.grey)
                      ]),
                  child: ExpansionTile(
                    title: Text('Border Countries'),
                    children: [
                      for (String code in country.borders)
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            code,
                            style: kBodyTextStyle,
                          ),
                        ),
                      Padding(
                          padding: EdgeInsets.only(top: size.height * 0.01)),
                    ],
                  ),
                ),
                //time zones
                Padding(padding: EdgeInsets.only(top: size.height * 0.03)),
                //calling codes
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xfff1f1f1),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(offset: Offset(1, 1), color: Colors.grey)
                      ]),
                  child: ExpansionTile(
                    title: Text('Time zones'),
                    children: [
                      for (String time in country.timezones)
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            time.toString(),
                            style: kBodyTextStyle,
                          ),
                        ),
                      Padding(
                          padding: EdgeInsets.only(top: size.height * 0.01)),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: size.height * 0.03)),
                //currencies
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xfff1f1f1),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(offset: Offset(1, 1), color: Colors.grey)
                      ]),
                  child: ExpansionTile(
                    title: Text('Currencies'),
                    children: [
                      for (Map currency in country.currencies)
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            currency['symbol'].toString() +
                                '    ' +
                                currency['name'],
                            style: kBodyTextStyle,
                          ),
                        ),
                      Padding(
                          padding: EdgeInsets.only(top: size.height * 0.01)),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: size.height * 0.03)),
                //languages
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xfff1f1f1),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(offset: Offset(1, 1), color: Colors.grey)
                      ]),
                  child: ExpansionTile(
                    title: Text('Languages'),
                    children: [
                      for (Map language in country.languages)
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            language['name'].toString() +
                                '  /  ' +
                                language['nativeName'],
                            style: kBodyTextStyle,
                          ),
                        ),
                      Padding(
                          padding: EdgeInsets.only(top: size.height * 0.01)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
