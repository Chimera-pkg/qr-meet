part of 'widgets.dart';

void ShowMaterialDialog(
    {context, title, description, titleAction, action, titleCancel, cancel}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)), //this right here
          child: Container(
            height: 200,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(title,
                          style: blackTextFont.copyWith(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text(
                        description,
                        textAlign: TextAlign.center,
                        style: blackTextFont.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          primary: mainColor,
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                        onPressed: () {
                          cancel();
                        },
                        child: Text(titleCancel),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [mainColor, accentColor1],
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(14.0),
                                primary: Colors.white,
                                textStyle: const TextStyle(fontSize: 16),
                              ),
                              onPressed: () async {
                                action();
                              },
                              child: Text(titleAction),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      });
}
