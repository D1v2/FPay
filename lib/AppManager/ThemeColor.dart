import 'package:flutter/material.dart';

bool lightMode = true;

class AppColor {
  static Color black900B2 = fromHex('#b2000000');
  static Color red600 = fromHex('#e74444');

  static Color red200 = fromHex('#e7b0b0');

  static Color indigo3003f = fromHex('#3f6f7dc8');

  static Color blueA200 = fromHex('#3694f4');

  static Color red400 = fromHex('#ec5458');

  static Color lightBlue80063 = fromHex('#63036ebd');

  static Color blue50063 = fromHex('#632189f4');

  static Color greenA700 = fromHex('#06b117');

  static Color gray600A2 = fromHex('#a27f7979');

  static Color gray6006c = fromHex('#6c7f7979');

  static Color gray804 = fromHex('#444444');

  static Color whiteA7004c = fromHex('#4cffffff');

  static Color gray600 = fromHex('#747688');

  static Color gray601 = fromHex('#7f7979');

  static Color gray400 = fromHex('#c4c4c4');

  static Color blue900 = fromHex('#185494');

  static Color gray401 = fromHex('#b4b4b4');

  static Color gray60067 = fromHex('#67747688');

  static Color gray802 = fromHex('#4f4f4f');

  static Color gray803 = fromHex('#3c3c3c');

  static Color bluegray100E5 = fromHex('#e5d2d5db');

  static Color blue500 = fromHex('#2189f4');

  static Color gray800 = fromHex('#47484a');

  static Color lightBlue80075 = fromHex('#75036ebd');

  static Color gray200 = fromHex('#eeeeee');

  static Color gray80099 = fromHex('#993c3c3c');

  static Color teal50063 = fromHex('#630ab685');

  static Color blue50 = fromHex('#daeafa');

  static Color blue50075 = fromHex('#752189f4');

  static Color bluegray800 = fromHex('#3c3e56');

  static Color whiteA70063 = fromHex('#63ffffff');

  static Color bluegray400 = fromHex('#888888');

  static Color bluegray10000 = fromHex('#00c7dce2');

  static Color whiteA701 = fromHex('#fffdfd');

  static Color whiteA700 = fromHex('#ffffff');

  static Color deepOrange50 = fromHex('#ffe4e4');

  static Color red700 = fromHex('#ee1c23');

  static Color bluegray10075 = fromHex('#75cdcdcd');

  static Color lightBlue802 = fromHex('#0670c0');

  static Color gray50 = fromHex('#f5fbfc');

  static Color lightBlue801 = fromHex('#046fbd');

  static Color lightBlue800 = fromHex('#036ebd');

  static Color greenA400 = fromHex('#22d288');

  static Color whiteA70075 = fromHex('#75ffffff');

  static Color black900 = fromHex('#000000');

  static Color black901 = fromHex('#060518');

  static Color black90029 = fromHex('#29000000');

  static Color purple400 = fromHex('#a666a6');

  static Color gray501 = fromHex('#939393');

  static Color gray301 = fromHex('#e4dede');

  static Color gray500 = fromHex('#a7a7a7');

  static Color amber400 = fromHex('#fbc928');

  static Color whiteA700A2 = fromHex('#a2ffffff');

  static Color blue600 = fromHex('#2d8ce2');

  static Color gray900 = fromHex('#110c26');

  static Color bluegray100 = fromHex('#cdcdcd');

  static Color gray101 = fromHex('#f4f4fe');

  static Color gray300 = fromHex('#e4dfdf');

  static Color gray100 = fromHex('#f2f2f2');

  static Color bluegray9000c = fromHex('#0c142850');

  static Color gray800A3 = fromHex('#a247484a');

  static Color gray800A2 = fromHex('#6d7172');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static Color bluegray50 = fromHex('#ebf1f3');

  static Color blueA400 = fromHex('#1977f3');

  static Color bluegray80019 = fromHex('#1929305b');

  static Color red401 = fromHex('#f44c46');

  static Color teal500 = fromHex('#e7f7f4');

  static Color gray40019 = fromHex('#19b1b1b4');

  static Color deepOrange300 = fromHex('#fd8a5a');

  static Color purple900 = fromHex('#580092');

  static Color whiteA70019 = fromHex('#19ffffff');

  static Color blue700 = fromHex('#0f70cc');

  static Color gray4003f = fromHex('#3fb0b1b3');

  static Color gray800100 = fromHex('#994f4f4f');

  static Color gray7003f = fromHex('#3f6a6a6a');

  static Color cyan600 = fromHex('#06b6b5');

  static Color indigo600 = fromHex('#383baa');

  static Color gray51 = fromHex('#f8f8f8');

  static Color deepPurple900 = fromHex('#340c7c');

  static Color gray5003f = fromHex('#3f9a9a9a');

  static Color indigoA200 = fromHex('#5f61ef');

  static Color black90023 = fromHex('#23000000');

  static Color gray700 = fromHex('#626268');

  static Color blue800 = fromHex('#1e67bf');

  static Color gray503 = fromHex('#9d9898');

  static Color amber200 = fromHex('#ffdf7f');

  static Color gray102 = fromHex('#f7f7f7');

  static Color indigo300 = fromHex('#6b7bcf');

  static Color bluegray900 = fromHex('#212739');

  static Color bluegray700 = fromHex('#424779');

  static Color cyan900 = fromHex('#00587a');

  static Color reportMessageColor = fromHex('#26B87A');

  static Color cardBackground = fromHex('#F5FBFC');

  static Color formBackGround = fromHex('#E7EDF2');

  static Color mainGradientTop = fromHex('#046FBD');

  static Color mainGradientBottom = fromHex('#2189F4');

  static Color amountColor = fromHex('#26B87A');

  static Color busBackgroundColor = fromHex('#E7EDF2');

  static Color bankNameColor = fromHex('#184682');

}

class AppWidgets {
  static var buttonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  );
  static var buttonTextStyle = const TextStyle(
    color: Colors.white,
  );
}