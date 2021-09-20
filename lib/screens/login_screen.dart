import 'package:flutter/material.dart';
import 'package:validacion_de_formularios/ui/input_decoration.dart';
import 'package:validacion_de_formularios/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: AuthBackground(
          child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: size.height * 0.3),
          CardContainer(
              child: Column(
            children: [
              SizedBox(
                height: size.height * 0.005,
              ),
              Text(
                'Login',
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              _LoginForm()
            ],
          )),
          SizedBox(height: size.height * 0.05),
          Text(
            'Crear una nueva cuenta',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ]),
      )),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Correo',
                  labelText: 'Correo Electronico',
                  prefixIcon: Icons.alternate_email_rounded),
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = new RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'El valor ingresado no es un correo';
              },
            ),
            SizedBox(height: size.height * 0.02),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '*****',
                  labelText: 'Contrasena',
                  prefixIcon: Icons.lock_outline),
              validator: (value) {
                return (value != null && value.length >= 6)
                    ? null
                    : 'La contrasena debe ser mayor de 6 caracteres';
              },
            ),
            SizedBox(height: size.height * 0.02),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.deepPurple,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                  child: Text(
                    'Ingresar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}
