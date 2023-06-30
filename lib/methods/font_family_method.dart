part of 'methods.dart';

dynamic getFontFamily(label) {
  switch (label) {
    case "Raleway":
      return GoogleFonts.raleway();
      break;
    case "Nunito":
      return GoogleFonts.nunito();
      break;
    case "Poppins":
      return GoogleFonts.poppins();
      break;
  }
}
