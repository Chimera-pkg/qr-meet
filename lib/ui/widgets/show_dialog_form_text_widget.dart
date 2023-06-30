part of 'widgets.dart';

void ShowMaterialFormTextDialog(
    {context,
    title,
    textController,
    titleAction,
    action,
    titleCancel,
    cancel,
    field,
    fontSize,
    fontFamily}) {
  String selectedFontSize = fontSize.toString() ?? "16";
  String selectedFontFamily = fontFamily ?? "Poppins";

  final List<String> itemFontFamily = [
    "Raleway",
    "Nunito",
    "Poppins",
  ];

  final List<String> itemFontSize = [
    "10",
    "11",
    "12",
    "14",
    "16",
    "18",
    "20",
    "24",
    "28",
    "32",
    "36",
    "40",
    "48",
    "52",
    "56",
    "64",
    "72",
    "84",
    "92",
    "100"
  ];

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)), //this right here
          child: Container(
            height: 290,
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
                      TextField(
                        onChanged: (text) {},
                        controller: textController,
                        maxLines: 4,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: mainColor),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ],
                  ),
                  Row(children: [
                    DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        hint: Text(
                          "Size",
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: itemFontSize
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item.toString(),
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: selectedFontSize,
                        onChanged: (value) {
                          selectedFontSize = value;
                          action(textController.text, selectedFontSize,
                              selectedFontFamily);
                        },
                        buttonHeight: 40,
                        itemHeight: 40,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          hint: Text(
                            "Family",
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          items: itemFontFamily
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item.toString(),
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          value: selectedFontFamily,
                          onChanged: (value) {
                            selectedFontFamily = value;
                            action(textController.text, selectedFontSize,
                                selectedFontFamily);
                          },
                          buttonHeight: 40,
                          itemHeight: 40,
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(12.0),
                            primary: mainColor,
                            textStyle: const TextStyle(fontSize: 16),
                          ),
                          onPressed: () {
                            cancel();
                          },
                          child: Text(titleCancel),
                        ),
                      ),
                      Expanded(
                          child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(mainColor),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(12)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(color: mainColor)))),
                        onPressed: () {
                          // setState(() {
                          //   dataContent[field] = textController.text;
                          // });
                          // Navigator.pop(context);
                          action(textController.text, selectedFontSize,
                              selectedFontFamily);
                        },
                        child: Text(titleAction,
                            style: whiteTextFont.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.white)),
                      )),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      });
}
