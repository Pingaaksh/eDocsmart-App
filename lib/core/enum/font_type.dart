import 'dart:ui';

//TODO:If you added any other font add in this below enum
enum FontFamilyType { elMessiri, productSansBold,poppins }

enum FontWeightType { light, regular, medium, semiBold, bold }

String getFontFamilyType(FontFamilyType? fontFamilyType) {
  switch (fontFamilyType) {
    case FontFamilyType.elMessiri:
      return 'ElMessiri';
    case FontFamilyType.productSansBold:
      return 'ProductSansBold';
    case FontFamilyType.poppins:
      return 'Poppins';
    case null:
      return '';
  }
}

Object getFontWeightType(FontWeightType? fontWeightType) {
  switch (fontWeightType) {
    case FontWeightType.light:
      return FontWeight.w300;
    case FontWeightType.regular:
      return FontWeight.w400;
    case FontWeightType.medium:
      return FontWeight.w500;
    case FontWeightType.semiBold:
      return FontWeight.w600;
    case FontWeightType.bold:
      return FontWeight.w700;
    case null:
      return FontWeightType.regular;
  }
}
