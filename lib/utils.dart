import 'package:flutter/material.dart';

double baseHeight = 640;

double screenAwareSize(double size, BuildContext context){
  return size * MediaQuery.of(context).size.height / baseHeight;
}