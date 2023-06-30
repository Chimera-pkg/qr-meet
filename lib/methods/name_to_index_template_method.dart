part of 'methods.dart';

int NameToIndexTemplateMethod(String name, List<dynamic> templates) {
  int index = 0;
  for (int i = 0; i < templates.length; i++) {
    if (templates[i]['name'] == name) {
      index = i;
    }
  }
  return index;
}
