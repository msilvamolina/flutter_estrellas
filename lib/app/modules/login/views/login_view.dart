import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/layouts/auth_layout.dart';
import 'package:flutter_svg/svg.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool logoInitialScale = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Hero(
            tag: 'logo',
            child: SvgPicture.asset(
              'assets/svg/logo.svg',
              width: 100,
            ),
          ),
          Text(
            'Ingresa a tu\n cuenta de Estrellas',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          TextField(
            keyboardType: TextInputType.text,
            // controller: controller.textController,

            onChanged: (v) {},
            decoration: InputDecoration(
              labelText: 'Documento',
              hintText: 'Ingresa tu número de documento',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            keyboardType: TextInputType.text,
            // controller: controller.textController,

            onChanged: (v) {},
            decoration: InputDecoration(
              labelText: 'Contraseña',
              hintText: 'Ingresa tu contraseña',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Iniciar sesión',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          TextButton(onPressed: () {}, child: Text('Olvidé mi contraseña')),
          Spacer(),
          Text('¿Quieres ser una Estrella?'),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Regístrate',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
