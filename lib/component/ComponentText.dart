import 'package:dating_app/util/ColorApp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComponentText extends StatelessWidget {
  String? teksColor;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      "Algorithm",
      style: GoogleFonts.poppins(
          textStyle: TextStyle(color: ColorApp.PrimaryColor)),
    );
  }
}
