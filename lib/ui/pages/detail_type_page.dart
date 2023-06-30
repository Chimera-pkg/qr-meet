part of 'pages.dart';

class DetailTypePage extends StatefulWidget {
  String name;
  String keyword;
  double logicWidth;
  double logicHeight;
  String title;
  UserModel user;

  DetailTypePage(
      {this.name,
      this.keyword,
      this.logicWidth,
      this.logicHeight,
      this.title,
      this.user});

  @override
  State<DetailTypePage> createState() => _DetailTypePageState();
}

class _DetailTypePageState extends State<DetailTypePage> {
  @override
  bool load = true;
  ScreenshotController screenshotController = ScreenshotController();
  bool isLoading = false;
  int selectedIndex = 0;
  bool isChangeColor = false;
  int counterColor = -1;

  File imageEditingIndividu = File("");

  List<dynamic> templates = [];
  List<dynamic> contentJsonTemplates = [];
  dynamic configUser;

  List fontSizes = [40, 40, 40, 40, 40];
  List fontFamilys = ["Poppins", "Poppins", "Poppins", "Poppins", "Poppins"];

  List colors = [
    Colors.green,
    Colors.green,
    Colors.green,
    Colors.green,
  ];

  List textController = [
    TextEditingController(text: tapToEdit),
    TextEditingController(text: tapToEdit),
    TextEditingController(text: tapToEdit),
    TextEditingController(text: tapToEdit),
    TextEditingController(text: tapToEdit),
  ];

  List imageEditingController = [
    File(""),
    File(""),
    File(""),
    File(""),
    File("")
  ];

  List imageSrc = [
    imageDefault,
    imageDefault,
    imageDefault,
    imageDefault,
    imageDefault,
  ];

  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    if (load == true) {
      templates = await ConfigServices.getConfig(name: widget.name);
      contentJsonTemplates =
          templates.map((el) => jsonDecode(el["content_json"])).toList();

      configUser = await ConfigUserServices.getConfig(
          column: "name", keyword: widget.keyword);

      if (configUser['name'] != null) {
        selectedIndex =
            NameToIndexTemplateMethod(configUser['name'], templates);
        setState(() {});
      }
    }

    int idxText = 0;
    int idxImage = 0;

    if (selectedIndex >= 0) {
      if (configUser == null || configUser == "" || configUser == []) {
        for (int i = 0; i < contentJsonTemplates[selectedIndex].length; i++) {
          if (contentJsonTemplates[selectedIndex][i]['id'] == "text_comp") {
            textController[idxText].text =
                contentJsonTemplates[selectedIndex][i]['text'];
            fontSizes[idxText] =
                contentJsonTemplates[selectedIndex][i]['fontSize'];
            fontFamilys[idxText] =
                contentJsonTemplates[selectedIndex][i]['fontFamily'];
            idxText = idxText + 1;
          } else if (contentJsonTemplates[selectedIndex][i]['id'] ==
                  "image_circle_comp" ||
              contentJsonTemplates[selectedIndex][i]['id'] ==
                  "image_square_comp" ||
              contentJsonTemplates[selectedIndex][i]['id'] ==
                  "image_square_rounded_comp" ||
              contentJsonTemplates[selectedIndex][i]['id'] ==
                  "image_logo_comp") {
            imageSrc[idxImage] = contentJsonTemplates[selectedIndex][i]['src'];
            idxImage = idxImage + 1;
          }
        }

        for (int i = 0; i < colors.length; i++) {
          colors[i] = Color(int.parse("0xff" +
              contentJsonTemplates[selectedIndex]
                      [contentJsonTemplates[selectedIndex].length - 1]["colors"]
                  [i]));
        }
      } else {
        if (configUser['texts'] != null)
          for (int i = 0; i < configUser['texts'].length; i++) {
            textController[i].text = configUser["texts"][i];
            fontSizes[i] = configUser["font_sizes"][i];
            fontFamilys[i] = configUser["font_familys"][i];
          }

        if (configUser['images'] != null)
          for (int i = 0; i < configUser['images'].length; i++) {
            imageSrc[i] = configUser["images"][i];
          }

        for (int i = 0; i < colors.length; i++) {
          colors[i] = Color(int.parse("0xff" + configUser["colors"][i]));
        }
      }
    }

    load = false;
    setState(() {});
  }

  void realData() async {
    if (load == true) {
      templates = await ConfigServices.getConfig(name: widget.name);
      contentJsonTemplates =
          templates.map((el) => jsonDecode(el["content_json"])).toList();

      configUser = await ConfigUserServices.getConfig(
          column: "name", keyword: widget.keyword);
    }

    int idxText = 0;
    int idxImage = 0;

    if (selectedIndex >= 0) {
      for (int i = 0; i < contentJsonTemplates[selectedIndex].length; i++) {
        if (contentJsonTemplates[selectedIndex][i]['id'] == "text_comp") {
          textController[idxText].text =
              contentJsonTemplates[selectedIndex][i]['text'];
          fontSizes[idxText] =
              contentJsonTemplates[selectedIndex][i]['fontSize'];
          fontFamilys[idxText] =
              contentJsonTemplates[selectedIndex][i]['fontFamily'];
          idxText = idxText + 1;
        } else if (contentJsonTemplates[selectedIndex][i]['id'] ==
                "image_circle_comp" ||
            contentJsonTemplates[selectedIndex][i]['id'] ==
                "image_square_comp" ||
            contentJsonTemplates[selectedIndex][i]['id'] ==
                "image_square_rounded_comp" ||
            contentJsonTemplates[selectedIndex][i]['id'] == "image_logo_comp") {
          imageSrc[idxImage] = contentJsonTemplates[selectedIndex][i]['src'];
          idxImage = idxImage + 1;
        }
      }

      for (int i = 0; i < colors.length; i++) {
        colors[i] = Color(int.parse("0xff" +
            contentJsonTemplates[selectedIndex]
                [contentJsonTemplates[selectedIndex].length - 1]["colors"][i]));
      }
    }

    load = false;
    setState(() {});
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
      },
      child: Scaffold(
          appBar: AppBarWidget(
              title: widget.title,
              actionDownload: () {
                DownloadDesign(
                    context: context,
                    screenshotController: screenshotController,
                    width: widget.logicWidth.toInt(),
                    height: widget.logicHeight.toInt());
              }),
          bottomNavigationBar: BottomNavigationBarWidget(
              context: context,
              isLoading: isLoading,
              isChangeColor: isChangeColor,
              selectedIndex: selectedIndex,
              dataLength: templates.length,
              colors: colors,
              onChangeColor: () {
                setState(() {
                  isChangeColor = !isChangeColor;
                });
              },
              handleChangeColor: (index, color) {
                setState(() {
                  colors[index] = color;
                });
              },
              prev: () {
                setState(() {
                  selectedIndex--;
                });
                fetchData();
              },
              next: () {
                setState(() {
                  selectedIndex++;
                });
                fetchData();
              },
              onApply: () async {
                bool success = false;
                ShowDialogLoadingWidget(context: context);

                if (selectedIndex == -1) {
                  success = true;
                } else {
                  List<String> urls = [];
                  for (int i = 0; i < imageEditingController.length; i++) {
                    if (imageEditingController[i].path == "" ||
                        imageEditingController[i].path == null) {
                      if (imageSrc[i] == null) {
                        urls.add(null);
                      } else {
                        urls.add(imageSrc[i]);
                      }
                    } else {
                      urls.add(await FirebaseStorageServices.uploadImage(
                          imageEditingController[i], widget.user.email));
                    }
                  }

                  List<String> texts = [];
                  for (int i = 0; i < textController.length; i++) {
                    if (textController[i].text == "" ||
                        textController[i].text == null) {
                    } else {
                      texts.add(textController[i].text);
                    }
                  }

                  Map<String, dynamic> dataContent = {};
                  dataContent['images'] = urls;
                  dataContent['texts'] = texts;
                  dataContent['font_sizes'] = fontSizes;
                  dataContent['font_familys'] = fontFamilys;
                  dataContent['colors'] = ColorToStringMethod(colors);
                  dataContent['name'] = templates[selectedIndex]['name'];

                  final res = await ConfigUserServices.setConfig(
                      keyword: widget.keyword, contentJson: dataContent);
                  if (res.statusCode == 200) success = true;
                }

                Uint8List image = await screenshotController.capture();
                image = resizeImage(image, widget.logicWidth.toInt(),
                    widget.logicHeight.toInt());
                if (image == null) return;

                final resultTexture = await TextureServices.updateTexture(
                    keyword: widget.keyword, image: image);

                Navigator.pop(context);

                if (success == true) {
                  ShowMaterialInfoDialog(
                    context: context,
                    title: "Berhasil Unggah",
                    description:
                        "Banner telah berhasil terunggah ke booth anda.",
                    titleAction: "Tutup",
                    action: () {
                      Navigator.pop(context);
                    },
                  );
                } else {
                  Flushbar(
                    duration: Duration(milliseconds: 4000),
                    flushbarPosition: FlushbarPosition.TOP,
                    backgroundColor: Color(0xFFFF5C83),
                    message: "Gagal upload desain!",
                  )..show(context);
                }
              }),
          body: RefreshIndicator(
            onRefresh: () async {
              load = true;
              await realData();
            },
            child: ListView(
              children: [
                Container(
                  width: double.infinity,
                  height: (MediaQuery.of(context).size.width -
                              (2 * defaultMargin)) *
                          widget.logicHeight /
                          widget.logicWidth +
                      40,
                  padding: EdgeInsets.symmetric(
                      horizontal: defaultMargin, vertical: 20),
                  // color: colorSelect.quaternary,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.16),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: SizedBox.expand(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                        child: Screenshot(
                            controller: screenshotController,
                            child: SizedBox(
                                width: widget.logicWidth,
                                height: widget.logicHeight,
                                child: (templates.length == 0 || load == true)
                                    ? Center(
                                        child: Text("Loading"),
                                      )
                                    : selectedIndex == -1
                                        ? GestureDetector(
                                            onTap: () async {
                                              dynamic img = await getImage();
                                              if (img != null) {
                                                dynamic image =
                                                    await cropImage(img);
                                                if (image != null) {
                                                  imageEditingIndividu = image;
                                                  setState(() {});
                                                }
                                              }
                                            },
                                            child: imageEditingIndividu.path !=
                                                    ""
                                                ? Container(
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                      image: FileImage(
                                                          imageEditingIndividu),
                                                      fit: BoxFit.cover,
                                                    )),
                                                  )
                                                : Center(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons.image_rounded,
                                                          size: 64,
                                                          color: accentColor2,
                                                        ),
                                                        SizedBox(height: 16),
                                                        Text(
                                                          "Upload Image",
                                                          style: blackTextFont
                                                              .copyWith(
                                                                  fontSize: 40,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ))
                                        : Container(
                                            color: Colors.white,
                                            child: BodyDesignWidget(
                                              context: context,
                                              templates: contentJsonTemplates,
                                              selectedIndex: selectedIndex,
                                              imageSrc: imageSrc,
                                              imageEditingController:
                                                  imageEditingController,
                                              textController: textController,
                                              fontSizes: fontSizes,
                                              fontFamilys: fontFamilys,
                                              colors: colors,
                                              updateImage: (index, v) {
                                                setState(() {
                                                  imageEditingController[
                                                      index] = v;
                                                });
                                              },
                                              updateText:
                                                  (index, size, family) {
                                                setState(() {
                                                  fontSizes[index] = size;
                                                  fontFamilys[index] = family;
                                                });
                                              },
                                            ),
                                          ))),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
