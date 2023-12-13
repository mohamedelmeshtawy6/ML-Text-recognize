// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mesht_ocr/features/home/presentation/controller/cubit/cubit/hometext_cubit.dart';
import 'package:mesht_ocr/features/home/presentation/controller/cubit/home_cubit.dart';

class ImagePresentation extends StatelessWidget {
  ImagePresentation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, right: 150),
      child: Stack(
        alignment: Alignment.center,
        children: [
          GestureDetector(
            onTap: () async {
              XFile? image = await BlocProvider.of<HomeCubit>(context)
                  .pickImageFromGallery();
              image != null
                  ? BlocProvider.of<HometextCubit>(context)
                      .getRecognizedText(image)
                  : print('cancelled');
            },
            onLongPress: () async {
              XFile? image = await BlocProvider.of<HomeCubit>(context)
                  .pickImageFromCamera();
              image != null
                  ? BlocProvider.of<HometextCubit>(context)
                      .getRecognizedText(image)
                  : print('cancelled');
            },
            child: Center(
                child: Image.asset(
              'assets/images/pin.png',
              height: 220,
              width: 150,
              fit: BoxFit.cover,
            )),
          ),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is Homepickedsuccess) {
                return Container(
                  child: Image.file(
                    state.image,
                    fit: BoxFit.cover,
                    height: 180,
                  ),
                );
              } else {
                return Container(
                    child: Icon(
                  Icons.camera_front,
                  size: 80,
                ));
              }
            },
          )
        ],
      ),
    );
  }
}
