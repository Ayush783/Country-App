//@dart=2.9
import 'package:country/constant/text_styles.dart';
import 'package:country/constant/textfield_decoration.dart';
import 'package:country/providers/show_buttons.dart';
import 'package:country/ui/home/widgets/home_screen_buttons.dart';
import 'package:country/ui/search_result/search_result_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();
  String _searchBy;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Container(
                height: size.height,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: size.height * 0.1)),
                      Text(
                        'Get country details from all over the globe',
                        style: kheadingTextStyle,
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: size.height * 0.08)),
                      SvgPicture.asset(
                        'assets/images/image1.svg',
                        width: size.width * 0.5,
                      ),
                      Padding(padding: EdgeInsets.only(top: size.height * 0.1)),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: DropdownButton(
                                items: searchBy
                                    .map(
                                      (e) => DropdownMenuItem(
                                        child: Text(e),
                                        value: e,
                                      ),
                                    )
                                    .toList(),
                                hint: Text('Search By'),
                                onChanged: (value) {
                                  _searchBy = value;
                                  setState(() {});
                                },
                                value: _searchBy,
                                iconEnabledColor: Color(0xff6C63FF),
                                underline: Container(),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: size.width * 0.75,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(2, 2),
                                      color: Colors.grey,
                                      blurRadius: 2,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(32)),
                              child: TextField(
                                controller: controller,
                                decoration: kInputDecoration(size),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: size.height * 0.1)),
                      ElevatedButton(
                        onPressed: () {
                          if (controller.text.isNotEmpty &&
                              _searchBy.isNotEmpty) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SearchResultProvider(
                                  query: controller.text,
                                  searchBy: _searchBy,
                                ),
                              ),
                            );
                            // controller.text = '';
                          } else
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => Container(
                                height: 48,
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                color: Colors.red,
                                child: Text(
                                  'Invalid Input',
                                  style: kBodyTextStyle.copyWith(
                                      color: Colors.white),
                                ),
                              ),
                              elevation: 4,
                              isDismissible: true,
                            );
                        },
                        child: Text(
                          'Search',
                          style: kBodyTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //buttons for saved and favourites
            HomeScreenButtons(size: size),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read(showButtonsProvider).toggleShow();
          },
          child: SvgPicture.asset(
            'assets/icons/menu.svg',
            height: 24,
            color: Colors.white,
          ),
          backgroundColor: Color(0xff6C63FF),
        ),
      ),
    );
  }
}

List<String> searchBy = [
  'Name',
  'Code',
  'Region',
  'Capital',
  'Language',
  'Currency'
];
