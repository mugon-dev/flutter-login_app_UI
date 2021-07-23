import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/pages/constants/colors.dart';
import 'package:login_app/pages/size/size.dart';

class LoginPageSecond extends StatefulWidget {
  const LoginPageSecond({Key? key}) : super(key: key);

  @override
  _LoginPageSecondState createState() => _LoginPageSecondState();
}

class _LoginPageSecondState extends State<LoginPageSecond> {
  bool isEmailClicked = false;
  bool isPassordClicked = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            _header(),
            SizedBox(height: 20),
            _loginOptions(context),
            _textField("Email", isEmailClicked, emailController),
            _textField("Password", isPassordClicked, passwordController),
            SizedBox(height: 20),
            _bottom(),
          ],
        ),
      ),
    );
  }

  Widget _bottom() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          width: getScreenWidth(context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(colors: [
              Colors.purple,
              Colors.pink,
            ]),
          ),
          child: Text(
            'Log In',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Dont have an account?',
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(width: 5),
            Text(
              'Sign Up',
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ]),
    );
  }

  Widget _textField(
      String option, bool clicked, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            option,
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 15),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    colors: clicked
                        ? [
                            Colors.purple,
                            Colors.pink,
                          ]
                        : [
                            BorderColor,
                            BorderColor,
                          ])),
            child: TextField(
              controller: controller,
              onTap: () {
                setState(() {
                  clicked = true;
                });
              },
              decoration: InputDecoration(
                  hintText: '$option the email',
                  hintStyle:
                      GoogleFonts.poppins(color: Colors.white, fontSize: 15),
                  fillColor: ContainerColor,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginOptions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Log In with one of the following options',
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 15),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _loginOptionsIcon(context, "google"),
              _loginOptionsIcon(context, "apple"),
            ],
          )
        ],
      ),
    );
  }

  Widget _loginOptionsIcon(BuildContext context, String icon) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: getGoogleOrAppleIconWidth(context),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: ContainerColor,
          border: Border.all(
            width: 2,
            color: BorderColor,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          width: 30,
          height: 30,
          child: Image.asset(
            'assets/images/$icon.png',
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: BorderColor,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 15,
            ),
          ),
          SizedBox(width: 20),
          Text(
            'Log In',
            style: GoogleFonts.poppins(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          )
        ],
      ),
    );
  }
}
