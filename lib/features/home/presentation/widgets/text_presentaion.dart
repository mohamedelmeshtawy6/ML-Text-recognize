import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mesht_ocr/features/home/presentation/controller/cubit/cubit/hometext_cubit.dart';
import 'package:mesht_ocr/features/home/presentation/controller/cubit/home_cubit.dart';

class TextPresentation extends StatelessWidget {
  const TextPresentation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HometextCubit, HometextState>(
      builder: (context, state) {
        return Container(
            width: 300,
            height: 250,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                'assets/images/note.jpg',
              ),
            )),
           padding: const EdgeInsets.only(left: 70, right: 60,top: 10,bottom: 10),
            child:SingleChildScrollView(child: state is Recognized ? Text(state.text):Text('No Images Are Choosen')));
      },
    );
  }
}
