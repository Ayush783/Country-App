//@dart=2.9
import 'package:country/blocs/search_bloc/search_bloc.dart';
import 'package:country/ui/search_result/search_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultProvider extends StatelessWidget {
  final String query;
  const SearchResultProvider({Key key, this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
        create: (context) => SearchBloc()
          ..add(
            SearchCountry(query),
          ),
        child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            if (state is SearchSuccess)
              return SearchResultScreen(
                query: query,
              );
            else if (state is Searching)
              return Scaffold(
                  body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
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
