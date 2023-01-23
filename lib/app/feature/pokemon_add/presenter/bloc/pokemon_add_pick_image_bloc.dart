import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class PokemonAddPickImageBloc extends Cubit<String> {
  PokemonAddPickImageBloc() : super('');

  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      emit(image.path);
    }
  }
}
