part of 'components.dart';

Future<File> action() async {
  dynamic img = await getImage();
  if (img != null) {
    dynamic image = await cropImage(img);
    if (image != null) {
      return image;
    }
  }
  return null;
}

Widget ImageLogoComp(
    {left,
    right,
    top,
    bottom,
    width,
    height,
    src,
    color,
    imageEditingController,
    update}) {
  return Positioned(
    left: left?.toDouble(),
    right: right?.toDouble(),
    top: top?.toDouble(),
    bottom: bottom?.toDouble(),
    child: GestureDetector(
      onTap: () async {
        dynamic temp = await action();
        if (temp != null) update(temp);
      },
      child: Container(
        width: width?.toDouble(),
        height: height?.toDouble(),
        child: FadeInImage(
          image: imageEditingController.path != ""
              ? FileImage(imageEditingController)
              : src != null
                  ? NetworkImage(
                      src,
                    )
                  : AssetImage("assets/banner/logo.png"),
          placeholder: AssetImage("assets/banner/logo.png"),
          imageErrorBuilder: (context, error, stackTrace) {
            return Image.asset('assets/banner/logo.png', fit: BoxFit.cover);
          },
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

Widget ImageSquareComp(
    {left,
    right,
    top,
    bottom,
    width,
    height,
    src,
    color,
    border = 10.0,
    imageEditingController,
    update}) {
  return Positioned(
    left: left?.toDouble(),
    right: right?.toDouble(),
    top: top?.toDouble(),
    bottom: bottom?.toDouble(),
    child: GestureDetector(
      onTap: () async {
        dynamic temp = await action();
        if (temp != null) update(temp);
      },
      child: Container(
        width: width?.toDouble(),
        height: height?.toDouble(),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: color, width: border?.toDouble() ?? 0),
        ),
        child: FadeInImage(
          image: imageEditingController.path != ""
              ? FileImage(imageEditingController)
              : src != null
                  ? NetworkImage(src)
                  : AssetImage("assets/example.jpg"),
          placeholder: AssetImage("assets/example.jpg"),
          imageErrorBuilder: (context, error, stackTrace) {
            return Image.asset('assets/example.jpg', fit: BoxFit.cover);
          },
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

Widget ImageSquareRoundedComp(
    {left,
    right,
    top,
    bottom,
    width,
    height,
    src,
    color,
    border = 10.0,
    rounded = 10.0,
    imageEditingController,
    update}) {
  return Positioned(
    left: left?.toDouble(),
    right: right?.toDouble(),
    top: top?.toDouble(),
    bottom: bottom?.toDouble(),
    child: GestureDetector(
      onTap: () async {
        dynamic temp = await action();
        if (temp != null) update(temp);
      },
      child: Container(
          width: width?.toDouble(),
          height: height?.toDouble(),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: color, width: border?.toDouble() ?? 0),
            borderRadius: BorderRadius.circular(rounded?.toDouble() ?? 0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(rounded?.toDouble() ?? 0),
            child: FadeInImage(
              image: imageEditingController.path != ""
                  ? FileImage(imageEditingController)
                  : src != null
                      ? NetworkImage(src)
                      : AssetImage("assets/example.jpg"),
              placeholder: AssetImage("assets/example.jpg"),
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.asset('assets/example.jpg', fit: BoxFit.cover);
              },
              fit: BoxFit.cover,
            ),
          )),
    ),
  );
}

Widget ImageCircleComp(
    {left,
    right,
    top,
    bottom,
    width,
    height,
    src,
    color,
    border = 10.0,
    imageEditingController,
    update}) {
  return Positioned(
    left: left?.toDouble(),
    right: right?.toDouble(),
    top: top?.toDouble(),
    bottom: bottom?.toDouble(),
    child: GestureDetector(
      onTap: () async {
        dynamic temp = await action();
        if (temp != null) update(temp);
      },
      child: Container(
          width: width?.toDouble(),
          height: height?.toDouble(),
          // padding: EdgeInsets.only(left: 25, right: 25),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            border: Border.all(color: color, width: border?.toDouble() ?? 0),
          ),
          child: ClipOval(
            child: FadeInImage(
              image: imageEditingController.path != ""
                  ? FileImage(imageEditingController)
                  : src != null
                      ? NetworkImage(src)
                      : AssetImage("assets/example.jpg"),
              placeholder: AssetImage("assets/example.jpg"),
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.asset('assets/example.jpg', fit: BoxFit.cover);
              },
              fit: BoxFit.cover,
            ),
          )),
    ),
  );
}

Widget ImageStaticComp({left, right, top, bottom, width, height, src}) {
  return Positioned(
    left: left?.toDouble(),
    right: right?.toDouble(),
    top: top?.toDouble(),
    bottom: bottom?.toDouble(),
    child: Container(
      height: height?.toDouble(),
      width: width?.toDouble(),
      child: FadeInImage(
        image: src != null
            ? NetworkImage(src)
            : AssetImage("assets/banner/logo.png"),
        placeholder: AssetImage("assets/banner/logo.png"),
        imageErrorBuilder: (context, error, stackTrace) {
          return Image.asset('assets/banner/logo.png', fit: BoxFit.cover);
        },
        fit: BoxFit.cover,
      ),
    ),
  );
}
