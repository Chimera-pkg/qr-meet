part of 'methods.dart';

void RedirectMethod({context, String type, UserModel user}) async {
  switch (type) {
    case "Banner #1":
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailTypePage(
                    name: "banner_1_",
                    keyword: "banner_1",
                    logicWidth: 800.0,
                    logicHeight: 2000.0,
                    title: "Detail Banner #1",
                    user: user,
                  )));
      break;
    case "Banner #2":
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailTypePage(
                    name: "banner_2_",
                    keyword: "banner_2",
                    logicWidth: 800.0,
                    logicHeight: 2000.0,
                    title: "Detail Banner #2",
                    user: user,
                  )));
      break;
    case "Poster #1":
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailTypePage(
                    name: "poster_1_",
                    keyword: "poster_1",
                    logicWidth: 940.0,
                    logicHeight: 1400.0,
                    title: "Detail Poster #1",
                    user: user,
                  )));
      break;
    case "Poster #2":
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailTypePage(
                    name: "poster_2_",
                    keyword: "poster_2",
                    logicWidth: 940.0,
                    logicHeight: 1400.0,
                    title: "Detail Poster #2",
                    user: user,
                  )));
      break;
    case "Thumbnail":
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailTypePage(
                    name: "thumbnail_1_",
                    keyword: "thumbnail_1",
                    logicWidth: 640.0,
                    logicHeight: 360.0,
                    title: "Detail Thumbnail",
                    user: user,
                  )));
      break;
    case "Logo Header":
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailTypePage(
                    name: "logo_header_1_",
                    keyword: "logo_header_1",
                    logicWidth: 1600.0,
                    logicHeight: 200.0,
                    title: "Detail Logo Header",
                    user: user,
                  )));
      break;
    case "Logo":
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailTypePage(
                    name: "logo_1_",
                    keyword: "logo_1",
                    logicWidth: 750.0,
                    logicHeight: 500.0,
                    title: "Detail Logo",
                    user: user,
                  )));
      break;
  }
}
