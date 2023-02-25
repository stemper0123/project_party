import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_party/components/components.dart';
import 'package:project_party/screens/signup_screen.dart';
import 'package:project_party/styles/static_colors.dart';
import 'package:input_form_field/input_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          //color set to transperent or set your own color
        )
    );
    final TextEditingController _controller = TextEditingController();
    final TextEditingController _controller2 = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
        extendBody: true,
      body: SigningComponents.getTemplate(context, children: [
        Text('Login',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        GlobalComponents.getColumnDistance(5),
        SigningComponents.getInputFormField(
          controller: _controller,
          prefixIcon: Icons.mail,
          suffixIcon: Icons.info,
          hintText: "abc@email.com",
          labelText: "Email",
        ),
        SigningComponents.getInputFormField(
            controller: _controller2,
            prefixIcon: Icons.privacy_tip,
            labelText: "Passwort",
            isPassword: true),
        GlobalComponents.getButton("Einloggen", isRounded: true, onTap: signIn),
        GlobalComponents.getColumnDistance(30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Noch kein Account?", style: TextStyle(color: Colors.grey)),
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>  SignUpScreen())),
              child: Text("Dann jetzt registreiren.",
                  style: TextStyle(
                      decoration: TextDecoration.underline, color: Colors.black54)),
            ),
          ],
        ),
        GlobalComponents.getButton("Ohne Anmeldung fortfahren",
            isRounded: false,
            color: StaticColors.primary,
            textColor: StaticColors.secondary),
      ]),
    );
  }
  void signIn() async{
    print("Einloggen");
  }

  void abort() async{
    print("Einloggen");
  }

}
