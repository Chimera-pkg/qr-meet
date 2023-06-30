part of 'providers.dart';

class TypeProvider extends ChangeNotifier {
  List<TypeModel> tempTypes = [
    TypeModel(title: "Logo", size: "750 x 500 px", typeId: "1", position: "1"),
    TypeModel(
        title: "Logo Header",
        size: "1600 x 200 px",
        typeId: "5",
        position: "1"),
    TypeModel(
        title: "Poster #1", size: "940 x 1400 px", typeId: "3", position: "1"),
    TypeModel(
        title: "Poster #2", size: "940 x 1400 px", typeId: "3", position: "2"),
    TypeModel(
        title: "Banner #1", size: "800 x 2000 px", typeId: "4", position: "1"),
    TypeModel(
        title: "Banner #2", size: "800 x 2000 px", typeId: "4", position: "2"),
    TypeModel(
        title: "Thumbnail", size: "640 x 360 px", typeId: "2", position: "1"),
  ];

  List<TypeModel> get types => tempTypes;
}
