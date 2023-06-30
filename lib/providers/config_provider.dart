part of 'providers.dart';

class ConfigProvider with ChangeNotifier {
  List<ConfigModel> tempConfigs = [];
  List<ConfigModel> get configs => tempConfigs;
}
