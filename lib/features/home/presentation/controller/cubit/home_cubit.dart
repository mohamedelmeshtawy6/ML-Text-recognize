import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mesht_ocr/features/home/presentation/controller/cubit/cubit/hometext_cubit.dart';
import 'package:meta/meta.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  File? image;
 

  ImagePicker pick = ImagePicker();
 Future<XFile?> pickImageFromCamera() async {
    var picked = await pick.pickImage(source: ImageSource.camera);

    if (picked != null) {
      image = File(picked.path);
      emit(Homepickedsuccess(image: image!));
  
    } else {
      emit(Homepickedfail());
    }
   return picked;

  }

 Future<XFile?> pickImageFromGallery() async {
    var picked = await pick.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      image = File(picked.path);
      emit(Homepickedsuccess(image: image!));
    
    } else {
      emit(Homepickedfail());
    }

     return picked;
  }

   
}
