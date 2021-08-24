import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smoothie_juices/constants.dart';
import 'package:smoothie_juices/models/smoothie.dart';
import 'package:smoothie_juices/widgets/juice_details.dart';
import 'package:smoothie_juices/widgets/rps-2_custom_paint.dart';

class Smoothies extends StatelessWidget {
  Smoothies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(
        top: kDefaultPadding * 2,
        left: kDefaultPadding,
        right: kDefaultPadding,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Icon(
              FontAwesomeIcons.shoppingCart,
              size: 18.0,
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          RichText(
            text: TextSpan(
              style: GoogleFonts.nunito(
                color: kBlackColor,
              ),
              children: [
                TextSpan(
                  text: "Smoothie King ",
                  style: GoogleFonts.nunito(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.2,
                  ),
                ),
                TextSpan(
                  text: "Shakes",
                  style: GoogleFonts.nunito(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          TextField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: kDefaultPadding),
              hintText: "Search",
              hintStyle: GoogleFonts.nunito(
                color: Colors.grey.withOpacity(0.8),
              ),
              suffixIcon: Icon(
                FontAwesomeIcons.search,
                size: 16.0,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(29),
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              filled: true,
              fillColor: kSearchBarColor,
            ),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...List.generate(
                    Smoothie.smoothies.length,
                    (index) {
                      return Stack(
                        children: [
                          Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: size.width,
                                    height: size.height * 0.28,
                                    decoration: BoxDecoration(
                                      color: Smoothie.smoothies[index].color,
                                      borderRadius: BorderRadius.circular(29),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: -8,
                                    right: 18,
                                    child: CustomPaint(
                                      size: Size(
                                          100,
                                          (100 * 0.5)
                                              .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                      painter: RPS2CustomPainter(),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 18 + 32.5 + 12 / 2,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                            SmoothieDetails.routeName,
                                            arguments: {
                                              "assetName": Smoothie
                                                  .smoothies[index].assetName,
                                              "color": Smoothie
                                                  .smoothies[index].color,
                                              "price": Smoothie
                                                  .smoothies[index].price,
                                              "title": Smoothie
                                                  .smoothies[index].title,
                                              "text": Smoothie
                                                  .smoothies[index].text,
                                            });
                                      },
                                      child: CircleAvatar(
                                        radius: 12,
                                        backgroundColor:
                                            Smoothie.smoothies[index].color,
                                        child: Icon(
                                          FontAwesomeIcons.arrowRight,
                                          size: 12,
                                          color: kWhiteColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    right: 0,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: kDefaultPadding,
                                        left: kDefaultPadding,
                                        right: kDefaultPadding,
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                Smoothie.smoothies[index].title,
                                                style: GoogleFonts.nunito(
                                                    color: kWhiteColor,
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                              Text(
                                                "\$${Smoothie.smoothies[index].price}",
                                                style: GoogleFonts.nunito(
                                                    color: kWhiteColor,
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                          Icon(
                                            FontAwesomeIcons.heart,
                                            color: kWhiteColor,
                                            size: 20.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 36),
                            ],
                          ),
                          Positioned(
                            bottom: 0,
                            right: 18 + 80,
                            child: Hero(
                              tag: Smoothie.smoothies[index].assetName,
                              child: Image.asset(
                                Smoothie.smoothies[index].assetName,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
