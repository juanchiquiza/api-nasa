import 'package:flutter/material.dart';

class ElTiempoColors {
  static final Color primaryColor = hexToColor("#FF6F6C");
  static final Color secondaryColor = hexToColor("#FFC3C0");
  static final Color primaryTextColor = hexToColor("#212121");
  static final Color secondaryTextColor = hexToColor("#212121");
  static final Color thirdtextColor = hexToColor("#73818F");
  static final Color backgroundColor = hexToColor("#FFFFFF");
  static final Color backgroundColorQ2C = hexToColor("#F4F4F4");
  static final Color blackColor = hexToColor("#212121");
  static final Color darkColor = hexToColor("#B0B0B0");
  static final Color redColor = hexToColor("#FF5050");
  static final Color successColor = hexToColor("#00BF84");
  static final Color infoColor = hexToColor("#5092DE");
  static final Color warningColor = hexToColor("#BF8400");
  static final Color primaryButtonColor = hexToColor("#7FD322");
  static final Color primaryQ2CButtonColor = hexToColor("#5092DE");
  static final Color buttonColorBlue = hexToColor("#13A7E7");
  static final Color secondaryButtonColor = hexToColor("#FF6F6C");
  static final Color primarySmallButtonColor = hexToColor("#5092DE");
  static final Color secondarySmallButtonColor = hexToColor("#FF6F6C");
  static final Color primarySmallButtonDisableColor = hexToColor("#B0B0B0");
  static final Color secondarySmallButtonDisableColor = hexToColor("#B0B0B0");
  static final Color darkLigth = hexToColor("#4a4a4a");
  static final Color transparentPage = Color.fromRGBO(53, 53, 53, 0.72);
  static final Color gradientButton1 = hexToColor("#5092DE");
  static final Color gradientButton2 = hexToColor("#277ADE");
  static final Color orangeColor = hexToColor("#F8A156");
  static final Color greenColor = hexToColor("#1E8489");
  static final Color redLigthColor = hexToColor("#F7B5A7");
  //gradiente page login q2c
  static final Color initGradienteq2c = hexToColor("#B2D4D6");
  static final Color endGradienteq2c = hexToColor("#4CB3B8");
  //gradiente page login tienda
  static final Color initGradienteStore = hexToColor("#FFBAB8");
  static final Color endGradienteStore = hexToColor("#F96C67");
  //gradiente page login tienda
  static final Color initGradienteCor = hexToColor("#AFD4B2");
  static final Color endGradienteCor = hexToColor("#67A86B");
  static final Color greenColorLigth = hexToColor("#7FD323");
  static final Color colorEmpresarial = hexToColor("#31B534");
  static final Color colorQuqoHogar = hexToColor("#3EB1FF");

  // Nuevos Colores
  static final Color quqoRedColor = hexToColor("#FF2848");
  static final Color quqoBlueColor = hexToColor("#129FFF");
  static final Color quqoYellowColor = hexToColor("#FFD72E");
  static final Color quqoGreenColor = hexToColor("#00FF55");
  static final Color backgroundColorSearch = hexToColor("#EFEFEF");
  static final Color colorSearch = hexToColor("#CECECE");

  static final Color colorGray = hexToColor("#C1C1C1");
  static final Color colorCyan2 = hexToColor("#00E526");
  static final Color colorCyan = hexToColor("#78B3F9");
  static final Color colorBlueLight = hexToColor("#78A6EC");
  static final Color colorGreen = hexToColor("#00E426");
  static final Color colorOrange = hexToColor("#FF8F39");

  /// Construct a color from a hex code string, of the format #RRGGBB.
  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
