part of 'widgets.dart';

class TypeWidget extends StatelessWidget {
  TypeModel type;
  String check;
  int index;

  TypeWidget(this.type, {this.check, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width / 2 - 35, maxHeight: 150),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 5),
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
          ],
          border: Border.all(color: Colors.transparent, width: 2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text(type.title,
                style: orangeTextFont.copyWith(
                    fontSize: 16, fontWeight: FontWeight.bold)),
          ]),
          SizedBox(height: 5),
          Text(type.size,
              style: blackTextFont.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w400)),
          // SizedBox(height: 25),
          Expanded(child: Container()),
          Text(check,
              overflow: TextOverflow.fade,
              style: blackTextFont.copyWith(
                  fontSize: 14, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
