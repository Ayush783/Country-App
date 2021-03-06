//@dart=2.9
import 'package:country/blocs/search_bloc/search_bloc.dart';
import 'package:country/ui/search_result/search_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SearchResultProvider extends StatelessWidget {
  final String query, searchBy;
  const SearchResultProvider({Key key, this.query, this.searchBy})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
        create: (context) => SearchBloc()
          ..add(
            SearchCountry(query, searchBy),
          ),
        child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            if (state is SearchSuccess)
              return SearchResultScreen(
                query: query,
                countries: state.countries,
              );
            else if (state is Searching)
              return Scaffold(
                  body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Container(
                    child: Center(
                      child: Lottie.asset(
                        'assets/animations/loading.json',
                        height: 48,
                      ),
                    ),
                  )),
                ],
              ));
            else if (state is SearchFailed)
              return Scaffold(body: Center(child: Text(state.failure.error)));
            else
              return Scaffold(body: Container());
          },
        ));
  }
}
