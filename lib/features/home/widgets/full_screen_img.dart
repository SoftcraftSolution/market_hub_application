// lib/views/full_screen_image.dart
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/features/home/model/home_updates_model.dart';
import 'package:photo_view/photo_view.dart';

class FullScreenImage extends StatelessWidget {

  final HomeUpdate update;
  const FullScreenImage( this.update);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      body: Center(
        child: Hero(
          tag: update.id,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(12), // Rounded image corners
              child:
              update.image==null?
              Image.memory(base64Decode(update.imageBase64!),
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ): Image.network(
                update.image!,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              )
          ),
        ),
      ),
    );
  }
}
