import 'package:flutter/material.dart';
import 'package:weather/core/constant/images_path.dart';

BoxDecoration detailesPageBackground() {
  return const BoxDecoration(
    image: DecorationImage(
        image: AssetImage(detailesPageBackGround), fit: BoxFit.fill),
  );
}
