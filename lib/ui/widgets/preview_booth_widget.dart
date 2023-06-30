part of 'widgets.dart';

Widget PreviewBoothWidget({BuildContext context, boothTextures, user}) {
  return GestureDetector(
    onDoubleTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailPreviewBoothPage(
                  boothTextures: boothTextures, user: user)));
    },
    child: Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
          left: defaultMargin,
          top: defaultMargin,
          right: defaultMargin,
          bottom: 10),
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
                left: 0,
                right: 0,
                bottom: -48,
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

            user.exhibitor.premiumLevel == '1' ||
                    user.exhibitor.premiumLevel == '2' ||
                    user.exhibitor.premiumLevel == '3'
                ? Positioned(
                    left: user.exhibitor.premiumLevel == '1' ? null : 20,
                    right: user.exhibitor.premiumLevel == '1' ? 65 : null,
                    top: null,
                    bottom: 20,
                    child: Container(
                      width: 40,
                      height: 100,
                      decoration: BoxDecoration(
                          color: mainColor,
                          image: DecorationImage(
                            image: NetworkImage(boothTextures.length <= 4
                                ? imageBanner
                                : boothTextures[4]?.url ?? imageBanner),
                            fit: BoxFit.cover,
                          )),
                    ),
                  )
                : SizedBox(),

            user.exhibitor.premiumLevel == '2' ||
                    user.exhibitor.premiumLevel == '3'
                ? Positioned(
                    left: null,
                    right: 20,
                    top: null,
                    bottom: 20,
                    child: Container(
                      width: 40,
                      height: 100,
                      decoration: BoxDecoration(
                          color: mainColor,
                          image: DecorationImage(
                            image: NetworkImage(boothTextures.length <= 5
                                ? imageBanner
                                : boothTextures[5]?.url ?? imageBanner),
                            fit: BoxFit.cover,
                          )),
                    ),
                  )
                : SizedBox(),

            user.exhibitor.premiumLevel == '1' ||
                    user.exhibitor.premiumLevel == '2' ||
                    user.exhibitor.premiumLevel == '3'
                ? Positioned(
                    top: 60,
                    bottom: null,
                    child: Container(
                      width: 32,
                      height: 18,
                      decoration: BoxDecoration(
                          color: mainColor,
                          image: DecorationImage(
                            image: NetworkImage(boothTextures.length <= 6
                                ? imageThumbnail
                                : boothTextures[6]?.url ?? imageThumbnail),
                            fit: BoxFit.cover,
                          )),
                    ),
                  )
                : SizedBox(),

            user.exhibitor.premiumLevel == '1' ||
                    user.exhibitor.premiumLevel == '2' ||
                    user.exhibitor.premiumLevel == '3'
                ? Positioned(
                    left: user.exhibitor.premiumLevel == '1' ? 60 : 70,
                    right: null,
                    top: null,
                    bottom: 40,
                    child: Container(
                      width: 47,
                      height: 70,
                      decoration: BoxDecoration(
                          color: mainColor,
                          image: DecorationImage(
                            image: NetworkImage(boothTextures.length <= 2
                                ? imagePoster
                                : boothTextures[2]?.url ?? imagePoster),
                            fit: BoxFit.cover,
                          )),
                    ),
                  )
                : SizedBox(),

            user.exhibitor.premiumLevel == '2' ||
                    user.exhibitor.premiumLevel == '3'
                ? Positioned(
                    left: null,
                    right: 70,
                    top: null,
                    bottom: 40,
                    child: Container(
                      width: 47,
                      height: 70,
                      decoration: BoxDecoration(
                          color: mainColor,
                          image: DecorationImage(
                            image: NetworkImage(boothTextures.length <= 3
                                ? imagePoster
                                : boothTextures[3]?.url ?? imagePoster),
                            fit: BoxFit.cover,
                          )),
                    ),
                  )
                : SizedBox(),

            user.exhibitor.premiumLevel == '1' ||
                    user.exhibitor.premiumLevel == '2' ||
                    user.exhibitor.premiumLevel == '3'
                ? Positioned(
                    top: null,
                    bottom: 20,
                    child: Container(
                      width: 37,
                      height: 25,
                      decoration: BoxDecoration(
                          color: mainColor,
                          image: DecorationImage(
                            image: NetworkImage(boothTextures.length == 0
                                ? imageLogo
                                : boothTextures[0]?.url ?? imageLogo),
                            fit: BoxFit.cover,
                          )),
                    ),
                  )
                : SizedBox(),

            user.exhibitor.premiumLevel == '1' ||
                    user.exhibitor.premiumLevel == '2' ||
                    user.exhibitor.premiumLevel == '3'
                ? Positioned(
                    top: 30,
                    bottom: null,
                    child: Container(
                      width: 120,
                      height: 15,
                      decoration: BoxDecoration(
                          color: mainColor,
                          image: DecorationImage(
                            image: NetworkImage(boothTextures.length <= 1
                                ? imageHeaderLogo
                                : boothTextures[1]?.url ?? imageHeaderLogo),
                            fit: BoxFit.cover,
                          )),
                    ),
                  )
                : SizedBox(),
            // Positioned(child: Align)
          ],
        ),
      ),
    ),
  );
}
