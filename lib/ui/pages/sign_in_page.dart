part of 'pages.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController eventIDController = TextEditingController();

  bool isEmailValid = !false;
  bool isPasswordValid = !false;
  bool isEventIDValid = !false;
  bool isSignIn = false;

  bool isObscure = true;

  initState() {
    super.initState();
    // emailController.text = "exhibitor.f39@pensfest.com";
    // passwordController.text = "ECkHkevR";
    // eventIDController.text = "pensfest";

    // emailController.text = "exhibitor.a9@demo.simhive.com";
    // passwordController.text = "A9WMTEdj";
    // eventIDController.text = "simhive-live3d";

    // emailController.text = "exhibitor.a45@demo.simhive.com";
    // passwordController.text = "cqcIXfNq";
    // eventIDController.text = "simhive-live3d";

    // emailController.text = "exhibitor.a61@demo.simhive.com";
    // passwordController.text = "FMiUGGbG";
    // eventIDController.text = "simhive-live3d";

    // A3
    // _emailController.text = "exhibitor.f3@pensfest.com";
    // _passwordController.text = "uNxLsbqD";
  }

  @override
  Widget build(BuildContext context) {
    String token = Provider.of<TokenProvider>(context).token;
    final userProvider = Provider.of<UserProvider>(context);
    UserModel user = userProvider.user;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  SizedBox(
                    height: 70,
                    width: 210,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        // color: Colors.grey[200],
                        image: DecorationImage(
                          image: AssetImage('assets/logo_start_page.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30, bottom: 40),
                    child: Text("Selamat Datang",
                        style: blackTextFont.copyWith(fontSize: 20)),
                  ),
                  TextField(
                    onChanged: (text) {
                      setState(() {
                        isEventIDValid = text.length >= 1;
                      });
                    },
                    controller: eventIDController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Event ID",
                        hintText: "Event ID"),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    onChanged: (text) {
                      setState(() {
                        // _emailController.text = text.trim();
                        isEmailValid =
                            EmailValidator.validate(emailController.text);
                      });
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Email Address",
                        hintText: "Email Address"),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    onChanged: (text) {
                      setState(() {
                        isPasswordValid = text.length >= 6;
                      });
                    },
                    controller: passwordController,
                    obscureText: isObscure,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Password",
                      hintText: "Password",
                      suffixIcon: IconButton(
                        icon: Icon(
                          isObscure ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Center(
                    child: Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(top: 40, bottom: 30),
                      child: isSignIn
                          ? SpinKitFadingCircle(
                              color: mainColor,
                            )
                          : FloatingActionButton(
                              elevation: 0,
                              backgroundColor: isEmailValid && isPasswordValid
                                  ? mainColor
                                  : Color(0xFFE4E4E4),
                              onPressed: isEmailValid && isPasswordValid
                                  ? () async {
                                      final prefs =
                                          await SharedPreferences.getInstance();
                                      setState(() {
                                        isSignIn = true;
                                      });
                                      var result = await AuthServices.login(
                                          email: emailController.text.trim(),
                                          password: passwordController.text,
                                          eventID: eventIDController.text);

                                      if (result.statusCode == 200) {
                                        dynamic tempToken =
                                            jsonDecode(result.body.toString())[
                                                'access_token'];

                                        token = tempToken;
                                        await prefs.setString('token', token);

                                        final resultUser =
                                            await UserServices.getUser(
                                                token: token);

                                        userProvider.setUser(resultUser);

                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ChooseTypePage(
                                                        resultUser)));
                                      } else {
                                        if (jsonDecode(
                                                result.body)["message"] ==
                                            "Unauthenticated.") {
                                          Flushbar(
                                            duration:
                                                Duration(milliseconds: 4000),
                                            flushbarPosition:
                                                FlushbarPosition.TOP,
                                            backgroundColor: Color(0xFFFF5C83),
                                            message:
                                                "Email atau kata sandi salah!",
                                          )..show(context);
                                        } else {
                                          Flushbar(
                                            duration:
                                                Duration(milliseconds: 4000),
                                            flushbarPosition:
                                                FlushbarPosition.TOP,
                                            backgroundColor: Color(0xFFFF5C83),
                                            message: "Event ID salah!",
                                          )..show(context);
                                        }
                                      }
                                      setState(() {
                                        isSignIn = false;
                                      });
                                    }
                                  : null,
                              child: Icon(
                                Icons.arrow_forward,
                                color: isEmailValid && isPasswordValid
                                    ? Colors.white
                                    : Color(0xFFBEBEBE),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
