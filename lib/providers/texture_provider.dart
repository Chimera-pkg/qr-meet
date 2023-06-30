part of 'providers.dart';

class TextureProvider extends ChangeNotifier {
  List<TextureModel> tempTextures = [];
  List<TextureModel> get textures => tempTextures;

  Future<void> setTextures(List<TextureModel> textures) async {
    tempTextures = textures;
    notifyListeners();
  }
}
