import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );

      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text(
                "Se envió un enlace de reestablecimiento de Contraseña. Revise su Email!"),
          );
        },
      );
    } on FirebaseException catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            //TODO: CAMBIAR EL TEXTO DE ERROR
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent[400],
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Ingrese su correo electrónico y le enviaremos un enlace de restablecimiento de contraseña",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),

            const SizedBox(height: 10),

            //Email TextField
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            MaterialButton(
              onPressed: passwordReset,
              color: Colors.deepOrangeAccent[400],
              child: const Text(
                "Resetear Password",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ));
  }
}
