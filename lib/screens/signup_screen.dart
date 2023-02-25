import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_party/components/components.dart';
import 'package:project_party/styles/static_colors.dart';
import 'package:input_form_field/input_form_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  BuildContext? context;
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    final TextEditingController _controller2 = TextEditingController();
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
    this.context = context;
    return SigningComponents.getTemplate(context, children: [
      Text('Registrieren',
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
        controller: _controller,
        prefixIcon: Icons.mail,
        suffixIcon: Icons.info,
        hintText: "PartyTyp23421",
        labelText: "Benutzername",
      ),
      SigningComponents.getInputFormField(
          controller: _controller2,
          prefixIcon: Icons.privacy_tip,
          labelText: "Passwort",
          isPassword: true),
      GlobalComponents.getColumnDistance(30),
      GlobalComponents.getButton("Registrieren", isRounded: true, onTap: signUp),
      GlobalComponents.getColumnDistance(10),
      GlobalComponents.getButton("Abbrechen",
          isRounded: false,
          color: StaticColors.primary,
          textColor: StaticColors.secondary,
          onTap: abort,
      ),
    ]);

  }
  void signUp() async{
    print("Einloggen");
  }

  void abort() async{
    if(context != null) {
      Navigator.pop(context!);
    }
  }
}
