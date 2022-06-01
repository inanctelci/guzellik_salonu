import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var projectFont = GoogleFonts.sourceSansPro();

const backgroundColor = Color.fromARGB(255, 251, 244, 243);
const primaryColor = Color(0xFFF7858A6);
const secondaryColor = Color(0xFFCE49BF);
const textColor = Color(0xFFA63EC5);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Lütfen mail adresinizi girin";
const String kWrongEmailorPasswordError = "Mail adresi veya şifre yanlış";
const String kInvalidEmailError = "Lütfen geçerli bir mail adresi girin";
const String kEmailAlreadyUse = 'Bu mail zaten kullanılıyor';
const String kPassNullError = "Lütfen şifrenizi girin";
const String kShortPassError = "Şifre çok kısa";
const String kMatchPassError = "Şifreler eşleşmiyor";
const String kNameNullError = "Lütfen isminizi girin";
const String kSurNameNullError = "Lütfen soyisminizi girin";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

const List<String> timeZones = [
  '10:00',
  '11:00',
  '12:00',
  '13:00',
  '14:00',
  '15:00',
  '16:00',
  '17:00',
  '18:00',
  '19:00',
  '20:00',
  '21:00',
  '22:00',
];

const Map<String, Map<String, Map<dynamic, dynamic>>> servisler = {
  'sacServisleri': {
    'Kesim': {
      'isim': 'Saç Kesimi',
      'fiyat': 200,
      'imgSrc': 'assets/images/sac_kesimi.png',
      'isSelected': false,
    },
    'Fon': {
      'isim': 'Fön Çekme',
      'fiyat': 100,
      'imgSrc': 'assets/images/fon.png',
      'isSelected': false,
    },
    'Boya': {
      'isim': 'Saç Boyama',
      'fiyat': 300,
      'imgSrc': 'assets/images/sac_boyama.png',
      'isSelected': false,
    },
    'AfrikaOrgusu': {
      'isim': 'Afrika Örgüsü',
      'fiyat': 500,
      'imgSrc': 'assets/images/afrika_orgusu.png',
      'isSelected': false,
    },
    'Keratin Bakım': {
      'isim': 'Keratin Bakım',
      'fiyat': 250,
      'imgSrc': 'assets/images/keratin_bakim.png',
      'isSelected': false,
    },
  },
};

const Map<String, Map<dynamic, dynamic>> servis = {
  'Kesim': {
    'isim': 'Saç Kesimi',
    'fiyat': 200,
    'imgSrc': 'assets/images/sac_kesimi.png',
    'isSelected': false,
  },
  'Fon': {
    'isim': 'Fön Çekme',
    'fiyat': 100,
    'imgSrc': 'assets/images/fon.png',
    'isSelected': false,
  },
  'Boya': {
    'isim': 'Saç Boyama',
    'fiyat': 300,
    'imgSrc': 'assets/images/sac_boyama.png',
    'isSelected': false,
  },
  'AfrikaOrgusu': {
    'isim': 'Afrika Örgüsü',
    'fiyat': 500,
    'imgSrc': 'assets/images/afrika_orgusu.png',
    'isSelected': false,
  },
  'Keratin Bakım': {
    'isim': 'Keratin Bakım',
    'fiyat': 250,
    'imgSrc': 'assets/images/keratin_bakim.png',
    'isSelected': false,
  },
};
