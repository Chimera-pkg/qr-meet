part of 'widgets.dart';

Container BottomNavigationBarWidget(
    {context,
    isLoading,
    isChangeColor,
    selectedIndex,
    dataLength,
    colors,
    onChangeColor,
    handleChangeColor,
    prev,
    next,
    onApply}) {
  int counterColor = -1;

  return (Container(
      height: isChangeColor ? 140 : 70,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: isLoading
          ? SpinKitWave(color: mainColor, type: SpinKitWaveType.start)
          : Column(children: [
              isChangeColor
                  ? Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: colors.map<Widget>((e) {
                          counterColor = counterColor + 1;
                          return boxPalette(
                              context: context,
                              active: false,
                              i: counterColor,
                              color: e,
                              onChange: (index, color) {
                                handleChangeColor(index, color);
                              });
                        }).toList(),
                      ),
                    )
                  : SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    BTNChangeWidget(
                      active: !isChangeColor,
                      colorSelect: mainColor,
                      icon: Icons.color_lens_rounded,
                      onTap: () => {onChangeColor()},
                    ),
                    SizedBox(width: 8),
                    BTNChangeWidget(
                      active: true,
                      colorSelect: mainColor,
                      icon: Icons.upload_rounded,
                      onTap: () => {onApply()},
                    ),
                  ]),
                  Row(children: [
                    BTNChangeWidget(
                      active: selectedIndex == -1 ? false : true,
                      colorSelect: mainColor,
                      icon: Icons.chevron_left_rounded,
                      onTap: () {
                        if (selectedIndex >= 0) {
                          prev();
                        }
                      },
                    ),
                    SizedBox(width: 8),
                    Column(
                      children: [
                        Text((selectedIndex + 2).toString(),
                            style: blackTextFont.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            )),
                        Text("-",
                            style: blackTextFont.copyWith(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                            )),
                        Text((dataLength + 1).toString(),
                            style: blackTextFont.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                    SizedBox(width: 8),
                    BTNChangeWidget(
                      active: selectedIndex + 1 == dataLength ? false : true,
                      colorSelect: mainColor,
                      icon: Icons.chevron_right_rounded,
                      onTap: () {
                        if (dataLength > selectedIndex + 1) {
                          next();
                        }
                      },
                    ),
                  ])
                ],
              )
            ])));
}
