import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

class AuthLayout extends StatefulWidget {
  const AuthLayout({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  _AuthLayoutState createState() => _AuthLayoutState();
}

class _AuthLayoutState extends State<AuthLayout> {
  double _circle1TopInitial = -100;
  double _circle1TopFinal = 80;

  double _circle1LeftInitial = -50;
  double _circle1LeftFinal = 100;

  double _circle2TopInitial = 20;
  double _circle2TopFinal = 100;

  double _circle2LeftInitial = -50;
  double _circle2LeftFinal = 100;

  late double _circle1Top;
  late double _circle1Left;

  late double _circle2Left;
  late double _circle2Top;

  bool initialPosition = true;

  @override
  void initState() {
    super.initState();
    _circle1Top = _circle1TopInitial;
    _circle1Left = _circle1LeftInitial;

    _circle2Top = _circle2TopInitial;
    _circle2Left = _circle2LeftInitial;

    Timer.periodic(const Duration(seconds: 10), (timer) {
      setState(() {
        _circle1Top = _circle1Top == _circle1TopInitial
            ? _circle1TopFinal
            : _circle1TopInitial;
        _circle1Left = _circle1Left == _circle1LeftInitial
            ? _circle1LeftFinal
            : _circle1LeftInitial;
        _circle2Top = _circle2Top == _circle2TopInitial
            ? _circle2TopFinal
            : _circle2TopInitial;
        _circle2Left = _circle2Left == _circle2LeftInitial
            ? _circle2LeftFinal
            : _circle2LeftInitial;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double verticalHalf = screenHeight * 0.7;
    bool isMobile = screenWidth < 480;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Círculo 1 animado
          AnimatedPositioned(
            duration: Duration(seconds: 30),
            top: _circle1Top + verticalHalf,
            right: _circle1Left,
            child: _buildCircle(500, Color(0xFF9747FF).withOpacity(0.5)),
          ),
          // Círculo 2 animado
          AnimatedPositioned(
            duration: Duration(seconds: 40),
            top: _circle2Top + verticalHalf,
            left: _circle2Left,
            child: _buildCircle(600, Color(0xFF00FFA2).withOpacity(0.5)),
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
                          filter: ImageFilter.blur(sigmaX: 5000, sigmaY: 5000),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 2,
                                color: Colors.white.withOpacity(
                                    0.3), // Borde semi-transparente
                              ),
                            ),
                            child: widget.child,
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
