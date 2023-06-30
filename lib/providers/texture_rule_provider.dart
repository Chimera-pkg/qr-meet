part of 'providers.dart';

class TextureRuleProvider extends ChangeNotifier {
  List<TextureRuleModel> tempTextureRules = [];
  List<TextureRuleModel> get textureRules => tempTextureRules;
}
