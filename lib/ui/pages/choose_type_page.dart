part of 'pages.dart';

class ChooseTypePage extends StatefulWidget {
  UserModel user;

  ChooseTypePage(this.user);

  @override
  State<ChooseTypePage> createState() => _ChooseTypePageState();
}

class _ChooseTypePageState extends State<ChooseTypePage> {
  void initState() {
    super.initState();
    init();
  }

  String formatDate(String d) {
    if (d == null) return "Belum dibuat";
    String date = d.replaceFirst("T", "\n");
    date = date.replaceAll(".000000Z", "");
    return date;
  }

  void init() {
    widget.user.exhibitor.boothTextures =
        RewriteData(widget.user.exhibitor.boothTextures);

    setState(() {});
  }

  void fetchData() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final resultUser = await UserServices.getUser(token: token);
    widget.user = resultUser;

    widget.user.exhibitor.boothTextures =
        RewriteData(resultUser.exhibitor.boothTextures);

    setState(() {});
  }

  List<dynamic> RewriteData(data) {
    List temp = [null, null, null, null, null, null, null];

    for (int i = 0; i < data.length; i++) {
      if (data[i].textureTypeId == "1") {
        temp[0] = data[i];
      } else if (data[i].textureTypeId == "5") {
        temp[1] = data[i];
      } else if (data[i].textureTypeId == "3" && data[i].position == "1") {
        temp[2] = data[i];
      } else if (data[i].textureTypeId == "3" && data[i].position == "2") {
        temp[3] = data[i];
      } else if (data[i].textureTypeId == "4" && data[i].position == "1") {
        temp[4] = data[i];
      } else if (data[i].textureTypeId == "4" && data[i].position == "2") {
        temp[5] = data[i];
      } else if (data[i].textureTypeId == "2") {
        temp[6] = data[i];
      }
    }

    return temp;
  }

  @override
  Widget build(BuildContext context) {
    List<TypeModel> types =
        Provider.of<TypeProvider>(context, listen: false).types;

    String selectedValue;
    List<String> items = [
      'Keluar',
      'Umpan Balik',
      'Kendala Bug',
    ];

    return Scaffold(
        appBar: AppBar(
          title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("PictSnap",
                    style: blackTextFont.copyWith(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 3),
                Text(
                  versionApp,
                  style: greyTextFont.copyWith(
                      fontSize: 11, fontWeight: FontWeight.w300),
                  textAlign: TextAlign.left,
                )
              ]),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                hint: Text(
                  widget.user.exhibitor.name,
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: items
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                value: selectedValue,
                onChanged: (value) async {
                  setState(() {
                    selectedValue = value as String;
                  });
                  if (selectedValue == "Umpan Balik") {
                    final Uri urlFeedback =
                        Uri.parse('https://bit.ly/TanggapanExhibitor');
                    await runUrl(urlFeedback);
                  } else if (selectedValue == "Kendala Bug") {
                    final Uri urlReport =
                        Uri.parse('https://bit.ly/PictSnapBug');
                    await runUrl(urlReport);
                  } else if (selectedValue == "Keluar") {
                    ShowMaterialDialog(
                        context: context,
                        title: "Keluar",
                        description: "Apakah anda yakin ingin keluar?",
                        titleAction: "Keluar",
                        action: () async {
                          final prefs = await SharedPreferences.getInstance();
                          final success = await prefs.remove('token');
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInPage()));
                        },
                        titleCancel: "Kembali",
                        cancel: () => {Navigator.pop(context)});
                  }
                },
                buttonHeight: 40,
                itemHeight: 40,
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await fetchData();
          },
          child: ListView(
            children: [
              PreviewBoothWidget(
                context: context,
                boothTextures: widget.user.exhibitor.boothTextures,
                user: widget.user,
              ),
              Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: defaultMargin, vertical: 15),
                  child: Wrap(
                    spacing: 0,
                    runSpacing: 10,
                    children: types
                        .map((e) => GestureDetector(
                              onTap: () async {
                                await RedirectMethod(
                                    context: context,
                                    type: e.title,
                                    user: widget.user);
                              },
                              child: e.position == '1' ||
                                      e.position == '2' &&
                                          widget.user.exhibitor.premiumLevel ==
                                              '2' || e.position == '2' &&
                                          widget.user.exhibitor.premiumLevel ==
                                              '3'
                                  ? TypeWidget(e,
                                      check: widget.user.exhibitor.boothTextures
                                                      .length >
                                                  types.indexOf(e) &&
                                              widget.user.exhibitor.boothTextures[types.indexOf(e)] !=
                                                  null
                                          ? formatDate(widget
                                              .user
                                              .exhibitor
                                              .boothTextures[types.indexOf(e)]
                                              .updatedAt)
                                          : "-",
                                      index: types.indexOf(e))
                                  : SizedBox(),
                            ))
                        .toList(),
                  )),
            ],
          ),
        ));
  }
}
