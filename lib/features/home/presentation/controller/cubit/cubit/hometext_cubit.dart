import 'package:bloc/bloc.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'hometext_state.dart';

class HometextCubit extends Cubit<HometextState> {
  HometextCubit() : super(HometextInitial());
 late String scannedText;


Future getRecognizedText(XFile file)async{
   final inputimage=InputImage.fromFilePath(file.path);
   final textRecognizer=GoogleMlKit.vision.textRecognizer();
   RecognizedText recognizedText= await textRecognizer.processImage(inputimage);
   await textRecognizer.close();
   scannedText='';
   for (var block in recognizedText.blocks) {
    for (var line in block.lines) {
      scannedText="${scannedText}+${line.text}+'\n'";
    }
     
   }
 emit(Recognized(text: scannedText));

    
  }

}
