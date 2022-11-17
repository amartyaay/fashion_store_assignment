import 'package:fashion_store_assignment/logic/models/fonts.dart';
import 'package:flutter/cupertino.dart';

TextStyle brandNameStyle = safeGoogleFont(
  'Poppins',
  fontSize: 10,
  fontWeight: FontWeight.w500,
  height: 1.5,
  color: const Color(0xff7154b8),
);
TextStyle clothNameStyle = safeGoogleFont(
  'Poppins',
  fontSize: 12,
  fontWeight: FontWeight.w500,
  height: 1.5,
  color: const Color(0xff4b4a5a),
);
TextStyle cartPageStyle = safeGoogleFont(
  'Poppins',
  fontSize: 16,
  fontWeight: FontWeight.w600,
  height: 1.5,
  letterSpacing: 0.8,
  color: const Color.fromARGB(255, 0, 0, 0),
);
