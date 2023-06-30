part of 'widgets.dart';

Widget ShowDialogLoadingWidget({context}) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return Dialog(
          // The background color
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                // The loading indicator
                CircularProgressIndicator(
                  color: Colors.orange,
                ),
              ],
            ),
          ),
        );
      });
}
