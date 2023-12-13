import 'package:flutter/material.dart';
import 'package:mesht_ocr/features/home/presentation/widgets/image_presentation.dart';
import 'package:mesht_ocr/features/home/presentation/widgets/text_presentaion.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

 
  @override
  Widget build(BuildContext context) {
    return 
       Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/back.jpg"),
        )),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: 100,
          ),
const TextPresentation(),
ImagePresentation()
        
        ]),
      );
   
  }
}
