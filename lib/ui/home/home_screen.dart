import 'package:country/constant/text_styles.dart';
import 'package:country/constant/textfield_decoration.dart';
import 'package:country/ui/home/providers/show_buttons.dart';
import 'package:country/ui/home/widgets/home_screen_buttons.dart';
import 'package:country/ui/search_result/search_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
                      Container(
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
                        child: TextFormField(
                          controller: controller,
                          decoration: kInputDecoration(size),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: size.height * 0.1)),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SearchResultScreen(
                                query: controller.text,
                              ),
                            ),
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
