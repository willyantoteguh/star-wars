part of 'shared.dart';

const double margin = 24;

Color primaryColor = Color(0xFFeedf1d);
Color secondColor = Color(0xFF5a520c);
Color thirdColor = Color(0xFF7c740c);
Color greyColor = Color(0xFF747474);
Color silverColor = Color(0xFFC4C4C4);
Color whiteColor = Color(0xFFFFFFFF);
Color blackColor = Color(0xFF040404);

TextStyle regularTextFont = GoogleFonts.montserrat()
    .copyWith(color: blackColor, fontWeight: FontWeight.w500);

TextStyle userTextFont = GoogleFonts.poppins()
    .copyWith(color: blackColor, fontWeight: FontWeight.w500);    

TextStyle regularTextFontWhite = GoogleFonts.montserrat()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w500);

TextStyle regularTextFontPrimary = GoogleFonts.montserrat()
    .copyWith(color: primaryColor, fontWeight: FontWeight.w500);

TextStyle greyTextFont = GoogleFonts.montserrat()
    .copyWith(color: greyColor, fontWeight: FontWeight.w500);

TextStyle boldTextFontprimary = GoogleFonts.montserrat()
    .copyWith(color: primaryColor, fontWeight: FontWeight.bold);

TextStyle boldTextFont = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w900);

    


Widget loadingIndicator = SpinKitFadingCircle(
  size: 45,
  color: secondColor,
);