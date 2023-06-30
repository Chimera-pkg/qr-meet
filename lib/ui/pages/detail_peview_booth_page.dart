part of 'pages.dart';

class DetailPreviewBoothPage extends StatefulWidget {
  dynamic boothTextures;
  UserModel user;

  DetailPreviewBoothPage({this.boothTextures, this.user});

  @override
  State<DetailPreviewBoothPage> createState() => _DetailPreviewBoothPageState();
}

class _DetailPreviewBoothPageState extends State<DetailPreviewBoothPage> {
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      },
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(
              left: defaultMargin,
              top: defaultMargin,
              right: defaultMargin,
              bottom: defaultMargin),
          decoration: BoxDecoration(color: Colors.transparent),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.05),
                    spreadRadius: 4,
                    blurRadius: 5,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ]),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    left: 30,
                    right: 30,
                    bottom: -60,
                    child: SvgPicture.string(
                      "<svg width='1372' height='131' viewBox='0 0 1372 131' fill='none' xmlns='http://www.w3.org/2000/svg'><path d='M222.816 7.5L0 131H1372L1178.44 0L839.094 7.5L826.418 25H552.896L546.557 0L222.816 7.5Z' fill='#D9D9D9'/></svg>",
                      color: accentColor3,
                    )),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: SvgPicture.string(
                    "<svg width='1517' height='823' viewBox='0 0 1517 823' fill='none' xmlns='http://www.w3.org/2000/svg'><path d='M32.4657 33.1931L43.1327 22.2453C52.5307 12.6001 64.394 5.71708 77.4317 2.34525C83.453 0.788026 89.6473 0 95.8667 0H1410.2C1424.75 0 1438.99 4.23161 1451.17 12.1792L1462.99 19.8868C1473.18 26.5293 1481.6 35.5485 1487.52 46.1674L1495.81 61.0273C1501.84 71.8407 1505.1 83.9796 1505.3 96.3604L1516.36 783.184C1516.71 805.069 1499.07 823 1477.18 823C1470.5 823 1463.94 821.295 1458.11 818.047L1395.01 782.899C1371.77 769.952 1357.13 745.664 1356.53 719.068L1344.15 168.977C1344.05 164.673 1343.46 160.395 1342.38 156.227L1341.15 151.463C1337.88 138.781 1329.27 128.137 1317.56 122.28C1311.27 119.137 1304.34 117.5 1297.31 117.5H421H239.53C231.255 117.5 223.058 119.1 215.39 122.211L212.498 123.385C199.626 128.608 189.15 138.423 183.1 150.927C179.414 158.544 177.5 166.895 177.5 175.357V708.399C177.5 736.936 161.305 763.001 135.719 775.641L60.7486 812.678C54.9936 815.521 48.661 817 42.2421 817C18.9875 817 0.207644 798.014 0.46195 774.76L7.88617 95.9083C7.96169 89.0025 8.99069 82.1403 10.944 75.5161L14.2452 64.3205C17.6963 52.6171 23.9506 41.9323 32.4657 33.1931Z' fill='#FB8500'/><path d='M203 192.5L212.5 176L310 198.5H626.5V184.5H905V198.5L1221.5 192.5L1301 170L1326 176V295H1135.5L1051.5 240H905V570H626.5V240H476.5L398 295L203 284.5V192.5Z' fill='#FB8500'/></svg>",
                    color: accentColor2,
                  ),
                ),

                widget.user.exhibitor.premiumLevel == '1' ||
                        widget.user.exhibitor.premiumLevel == '2' ||
                        widget.user.exhibitor.premiumLevel == '3'
                    ? Positioned(
                        left: widget.user.exhibitor.premiumLevel == '1'
                            ? null
                            : 20,
                        right: widget.user.exhibitor.premiumLevel == '1'
                            ? 130
                            : null,
                        top: null,
                        bottom: 20,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailTypePage(
                                          name: "banner_1_",
                                          keyword: "banner_1",
                                          logicWidth: 800.0,
                                          logicHeight: 2000.0,
                                          title: "Detail Banner #1",
                                        )));
                          },
                          child: Container(
                            width: 80,
                            height: 200,
                            decoration: BoxDecoration(
                                color: mainColor,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      widget.boothTextures.length <= 4
                                          ? imageBanner
                                          : widget.boothTextures[4]?.url ??
                                              imageBanner),
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ),
                      )
                    : SizedBox(),

                widget.user.exhibitor.premiumLevel == '2' ||
                        widget.user.exhibitor.premiumLevel == '3'
                    ? Positioned(
                        left: null,
                        right: 40,
                        top: null,
                        bottom: 20,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailTypePage(
                                          name: "banner_2_",
                                          keyword: "banner_2",
                                          logicWidth: 800.0,
                                          logicHeight: 2000.0,
                                          title: "Detail Banner #2",
                                        )));
                          },
                          child: Container(
                            width: 80,
                            height: 200,
                            decoration: BoxDecoration(
                                color: mainColor,
                                image: DecorationImage(
                                  // image: NetworkImage(widget.boothTextures[5].url),
                                  image: NetworkImage(
                                      widget.boothTextures.length <= 5
                                          ? imageBanner
                                          : widget.boothTextures[5]?.url ??
                                              imageBanner),
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ),
                      )
                    : SizedBox(),

                widget.user.exhibitor.premiumLevel == '1' ||
                        widget.user.exhibitor.premiumLevel == '2' ||
                        widget.user.exhibitor.premiumLevel == '3'
                    ? Positioned(
                        top: 80,
                        bottom: null,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailTypePage(
                                          name: "thumbnail_1_",
                                          keyword: "thumbnail_1",
                                          logicWidth: 640.0,
                                          logicHeight: 360.0,
                                          title: "Detail Thumbnail",
                                        )));
                          },
                          child: Container(
                            width: 64,
                            height: 36,
                            decoration: BoxDecoration(
                                color: mainColor,
                                image: DecorationImage(
                                  // image: NetworkImage(widget.boothTextures[6].url),
                                  image: NetworkImage(
                                      widget.boothTextures.length <= 6
                                          ? imageThumbnail
                                          : widget.boothTextures[6]?.url ??
                                              imageThumbnail),
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ),
                      )
                    : SizedBox(),

                widget.user.exhibitor.premiumLevel == '1' ||
                        widget.user.exhibitor.premiumLevel == '2' ||
                        widget.user.exhibitor.premiumLevel == '3'
                    ? Positioned(
                        left: widget.user.exhibitor.premiumLevel == '1'
                            ? 120
                            : 130,
                        right: null,
                        top: null,
                        bottom: 40,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailTypePage(
                                          name: "poster_1_",
                                          keyword: "poster_1",
                                          logicWidth: 940.0,
                                          logicHeight: 1400.0,
                                          title: "Detail Poster #1",
                                        )));
                          },
                          child: Container(
                            width: 94,
                            height: 140,
                            decoration: BoxDecoration(
                                color: mainColor,
                                image: DecorationImage(
                                  // image: NetworkImage(widget.boothTextures[2].url),
                                  image: NetworkImage(
                                      widget.boothTextures.length <= 2
                                          ? imagePoster
                                          : widget.boothTextures[2]?.url ??
                                              imagePoster),
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ),
                      )
                    : SizedBox(),

                widget.user.exhibitor.premiumLevel == '2' ||
                        widget.user.exhibitor.premiumLevel == '3'
                    ? Positioned(
                        left: null,
                        right: 130,
                        top: null,
                        bottom: 40,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailTypePage(
                                          name: "poster_2_",
                                          keyword: "poster_2",
                                          logicWidth: 940.0,
                                          logicHeight: 1400.0,
                                          title: "Detail Poster #2",
                                        )));
                          },
                          child: Container(
                            width: 84,
                            height: 140,
                            decoration: BoxDecoration(
                                color: mainColor,
                                image: DecorationImage(
                                  // image: NetworkImage(widget.boothTextures[3].url),
                                  image: NetworkImage(
                                      widget.boothTextures.length <= 3
                                          ? imagePoster
                                          : widget.boothTextures[3]?.url ??
                                              imagePoster),
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ),
                      )
                    : SizedBox(),

                widget.user.exhibitor.premiumLevel == '1' ||
                        widget.user.exhibitor.premiumLevel == '2' ||
                        widget.user.exhibitor.premiumLevel == '3'
                    ? Positioned(
                        top: null,
                        bottom: 30,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailTypePage(
                                          name: "logo_1_",
                                          keyword: "logo_1",
                                          logicWidth: 750.0,
                                          logicHeight: 500.0,
                                          title: "Detail Logo",
                                        )));
                          },
                          child: Container(
                            width: 74,
                            height: 50,
                            decoration: BoxDecoration(
                                color: mainColor,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      widget.boothTextures.length == 0
                                          ? imageLogo
                                          : widget.boothTextures[0]?.url ??
                                              imageLogo),
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ),
                      )
                    : SizedBox(),

                widget.user.exhibitor.premiumLevel == '1' ||
                        widget.user.exhibitor.premiumLevel == '2' ||
                        widget.user.exhibitor.premiumLevel == '3'
                    ? Positioned(
                        top: 25,
                        bottom: null,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailTypePage(
                                          name: "logo_header_1_",
                                          keyword: "logo_header_1",
                                          logicWidth: 1600.0,
                                          logicHeight: 200.0,
                                          title: "Detail Logo Header",
                                        )));
                          },
                          child: Container(
                            width: 240,
                            height: 30,
                            decoration: BoxDecoration(
                                color: mainColor,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      widget.boothTextures.length <= 1
                                          ? imageHeaderLogo
                                          : widget.boothTextures[1]?.url ??
                                              imageHeaderLogo),
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ),
                      )
                    : SizedBox(),
                // Positioned(child: Align)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
