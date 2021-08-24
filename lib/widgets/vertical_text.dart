import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smoothie_juices/constants.dart';

class VerticalText extends StatelessWidget {
  final String text;
  final bool checked;
  final GlobalKey globalKey;
  const VerticalText({Key? key, 
    required this.text, 
    required this.checked,
    required this.globalKey
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      key: globalKey,
      quarterTurns: -1,
      child: Text(
        text,
        style: GoogleFonts.nunito(
            color: checked ? kYellowColor : kWhiteColor,
            fontSize: 18.0,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
