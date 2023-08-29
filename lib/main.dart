import 'package:flutter/material.dart';
import 'package:reference_converter/priors.dart';

void main() async {
  await setupPriors();
  runApp(const MaterialApp(home: AstroBase()));
}
