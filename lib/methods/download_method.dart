part of 'methods.dart';

dynamic DownloadDesign({context, screenshotController, width, height}) async {
  ShowDialogLoadingWidget(context: context);
  Uint8List image = await screenshotController.capture();
  image = resizeImage(image, width, height);
  String path = await saveImage(image);
  Navigator.pop(context);
  if (path == null) {
    Flushbar(
      duration: Duration(milliseconds: 4000),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Color(0xFFFF5C83),
      message: "Aplikasi tidak diberikan izin untuk mengakses penyimpanan",
    )..show(context);
  } else {
    ShowMaterialInfoDialog(
      context: context,
      title: "Berhasil Download",
      description: "Banner telah berhasil tersimpan di perangkat anda.",
      titleAction: "Tutup",
      action: () {
        Navigator.pop(context);
      },
    );
  }
}
