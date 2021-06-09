import 'package:flutter/material.dart';
import 'package:login_app/components/custom_text_form_field.dart';
import 'package:login_app/components/logo.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  late ScrollController scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = new ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          controller: scrollController,
          children: [
            SizedBox(height: 100),
            Logo("Login"),
            SizedBox(height: 50),
            buildLoginForm(),
            SizedBox(height: 50),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pushNamed(context, "/home");
                }
              },
              child: Text("Login"),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("New Here? "),
                GestureDetector(
                  onTap: () {
                    print("Join 클릭");
                  },
                  child: Text(
                    "Join",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField("Email", scrollAnimate),
          CustomTextFormField("Password", scrollAnimate),
        ],
      ),
    );
  }

  void scrollAnimate() {
    print("탭 클릭됨");
    Future.delayed(Duration(milliseconds: 600), () {
      print(MediaQuery.of(context).viewInsets.bottom);
      scrollController.animateTo(MediaQuery.of(context).viewInsets.bottom,
          duration: Duration(milliseconds: 100), curve: Curves.easeIn);
    });
  }
}
