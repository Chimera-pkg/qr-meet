part of 'pages.dart';

class StartPage extends StatefulWidget {
  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    String token = Provider.of<TokenProvider>(context).token;
    final userProvider = Provider.of<UserProvider>(context);
    UserModel user = userProvider.user;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 136,
                  padding: EdgeInsets.all(defaultMargin),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 3,
                        blurRadius: 16,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/logo_start_page.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(top: 70, bottom: 16),
                child: Text(
                  "Coba Sekarang",
                  style: blackTextFont.copyWith(fontSize: 20),
                ),
              ),
              Text("Buat desain anda dengan\nPictSnap App",
                  style: greyTextFont.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center),
              Container(
                width: 250,
                height: 46,
                margin: EdgeInsets.only(top: 70, bottom: 19),
                child: isLoading
                    ? SpinKitFadingCircle(
                        color: mainColor,
                      )
                    : ElevatedButton(
                        child: Text("Sign In",
                            style: whiteTextFont.copyWith(fontSize: 16)),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(mainColor),
                        ),
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          final prefs = await SharedPreferences.getInstance();
                          final tempToken = prefs.getString('token');

                          setState(() {
                            token = tempToken;
                          });

                          if (token == null || token == "") {
                            setState(() {
                              isLoading = false;
                            });
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInPage()));
                          } else {
                            final result =
                                await UserServices.getUser(token: token);
                            userProvider.setUser(result);

                            setState(() {
                              isLoading = false;
                            });
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ChooseTypePage(result)));
                          }
                        },
                      ),
              ),
              SizedBox(height: 10),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        versionApp,
                        style: greyTextFont.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w300),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () async {
                          final Uri urlPrivacy =
                              Uri.parse('https://simhive.com/privacy');
                          await runUrl(urlPrivacy);
                        },
                        child: Text(
                          "Kebijakan Privasi",
                          style: greyTextFont.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  )),
            ]),
      ),
    );
  }
}
