import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smoothie_juices/constants.dart';

class SmoothieDetails extends StatelessWidget {
  const SmoothieDetails({Key? key}) : super(key: key);

  static String routeName = "/smoothie-details";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(
                top: kDefaultPadding * 2,
                left: kDefaultPadding,
                right: kDefaultPadding,
              ),
              width: size.width,
              height: size.height,
              color: args['color'],
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/images/menu.png", height: 20),
                      Icon(
                        FontAwesomeIcons.shoppingCart,
                        color: kWhiteColor,
                        size: 16.0,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.nunito(
                          color: kWhiteColor.withOpacity(0.3),
                          fontSize: 76.0,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.2,
                        ),
                        children: [
                          TextSpan(
                            text: "Cold & ",
                          ),
                          TextSpan(text: "Creamy"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: size.height * 0.55,
            child: Container(
              padding: const EdgeInsets.fromLTRB(kDefaultPadding,
                  kDefaultPadding * 3, kDefaultPadding, kDefaultPadding),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(39),
                  topRight: Radius.circular(39),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            args['title'],
                            style: GoogleFonts.nunito(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 4),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...List.generate(
                                5,
                                (index) => Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.solidStar,
                                      color: Colors.yellow,
                                      size: 16.0,
                                    ),
                                    SizedBox(width: 2),
                                  ],
                                ),
                              ),
                              SizedBox(width: 6),
                              Text(
                                "5.0",
                                style: GoogleFonts.nunito(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: args['color'],
                        child: Icon(
                          FontAwesomeIcons.solidHeart,
                          color: kWhiteColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: args['color'],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "-",
                                style: GoogleFonts.nunito(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            "1",
                            style: GoogleFonts.nunito(
                                fontSize: 22.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 20),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: args['color'],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "+",
                                style: GoogleFonts.nunito(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "\$${args['price']}",
                        style: GoogleFonts.nunito(
                            fontSize: 22.0, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    args['text'] ?? "",
                    style: GoogleFonts.nunito(
                        fontSize: 17.0, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: size.height / 2 - 306,
            left: size.width / 2 - 100,
            child: Container(
              height: 350,
              width: 200,
              child: Hero(
                tag: args['assetName'] as Object,
                child: Image.asset(
                  args['assetName'],
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: kDefaultPadding,
            left: kDefaultPadding,
            right: kDefaultPadding,
            child:  Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 28,
                    child: CircleAvatar(
                      backgroundColor: kWhiteColor,
                      radius: 25,
                      child: Icon(
                        FontAwesomeIcons.arrowLeft,
                        color: args['color'],
                        size: 18.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: Center(
                      child: Text(
                        "Order Now",
                        style: GoogleFonts.nunito(
                            color: kWhiteColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
