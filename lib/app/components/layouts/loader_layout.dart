import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../themes/styles/colors.dart';

class LoaderLayout extends StatefulWidget {
  const LoaderLayout({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  _AuthLayoutState createState() => _AuthLayoutState();
}

class _AuthLayoutState extends State<LoaderLayout> {
  double _circle1TopInitial = -200;
  double _circle1TopFinal = 40;

  double _circle1LeftInitial = -300;
  double _circle1LeftFinal = 50;

  double _circle2TopInitial = 10;
  double _circle2TopFinal = 50;

  double _circle2LeftInitial = -300;
  double _circle2LeftFinal = 50;

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

    return Material(
      color: white,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [],
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
            child: _buildCircle(500, Color(0xFF9747FF).withOpacity(0.1)),
          ),
          // Círculo 2 animado
          AnimatedPositioned(
            duration: Duration(seconds: 40),
            top: _circle2Top + verticalHalf,
            left: _circle2Left,
            child: _buildCircle(600, Color(0xFF00FFA2).withOpacity(0.1)),
          ),
          Container(
            width: double.infinity, // Escalar para pantalla
            height: double.infinity, // Escalar para pantalla
            child: Container(
              decoration: BoxDecoration(),
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(isMobile ? 0 : 60),
                  width: double.infinity, // Escalar para pantalla
                  height: double.infinity,
                  // Escalar para pantalla
                  constraints: BoxConstraints(maxWidth: 480),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(isMobile ? 0 : 20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 90000, sigmaY: 90000),
                      child: Container(
                        child: widget.child,
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
