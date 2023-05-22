import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontSize {
  /// 12 px
  static const xXSmall = 12.0;

  /// 14 px
  static const xSmall = 14.0;

  /// 16 px
  static const small = 16.0;

  /// 20 px
  static const medium = 20.0;

  /// 32 px
  static const large = 32.0;
}

class FontStyle{
      final poppinsSmall = GoogleFonts.poppins(fontSize: FontSize.small, fontWeight: FontWeight.bold);
      final  poppinsMedium = GoogleFonts.poppins(fontSize: FontSize.medium, fontWeight: FontWeight.bold);
      final  poppinsLarge = GoogleFonts.poppins(fontSize: FontSize.large, fontWeight: FontWeight.bold);

}
