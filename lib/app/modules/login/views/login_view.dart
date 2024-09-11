import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<LoginView> {
  // Posiciones iniciales de los círculos
  double _circle1Top = 50;
  double _circle1Left = 100;
  double _circle2Top = 0;
  double _circle2Left = -500;

  @override
  void initState() {
    super.initState();
    // Mover los círculos cada 3 segundos
    Timer.periodic(Duration(seconds: 10), (timer) {
      setState(() {
        // Cambiar posiciones aleatoriamente para la animación
        _circle1Top = _circle1Top == 20 ? 150 : 20;
        _circle1Left = _circle1Left == 100 ? 200 : 100;
        _circle2Top = _circle2Top == 20 ? 100 : 20;
        _circle2Left = _circle2Left == -500 ? 0 : -500;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 480;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.purple.shade50],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Círculo 1 animado
          AnimatedPositioned(
            duration: Duration(seconds: 30),
            bottom: _circle1Top,
            left: _circle1Left,
            child: _buildCircle(500, Colors.purple),
          ),
          // Círculo 2 animado
          AnimatedPositioned(
            duration: Duration(seconds: 40),
            bottom: _circle2Top,
            left: _circle2Left,
            child: _buildCircle(600, Colors.green),
          ),
          Container(
            width: double.infinity, // Escalar para pantalla
            height: double.infinity, // Escalar para pantalla
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter:
                    ImageFilter.blur(sigmaX: 5000, sigmaY: 5000), // Desenfoque
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white
                        .withOpacity(0.2), // Fondo semi-transparente
                    borderRadius:
                        BorderRadius.circular(20), // Bordes redondeados
                    border: Border.all(
                      width: 2,
                      color: Colors.white
                          .withOpacity(0.3), // Borde semi-transparente
                    ),
                  ),
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.all(isMobile ? 0 : 60),

                      width: double.infinity, // Escalar para pantalla
                      height: double.infinity, // Escalar para pantalla
                      constraints: BoxConstraints(maxWidth: 480),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                              sigmaX: 5000, sigmaY: 5000), // Desenfoque
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white
                                  .withOpacity(0.2), // Fondo semi-transparente
                              borderRadius: BorderRadius.circular(
                                  20), // Bordes redondeados
                              border: Border.all(
                                width: 2,
                                color: Colors.white.withOpacity(
                                    0.3), // Borde semi-transparente
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Glass Effect',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Función para construir un círculo
  Widget _buildCircle(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
