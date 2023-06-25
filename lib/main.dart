import 'package:flutter/material.dart';
import 'package:reference_converter/astro_base.dart';

void main() async {
  await astroInitialization();
  runApp(const MaterialApp(home: AstroBase()));
}
