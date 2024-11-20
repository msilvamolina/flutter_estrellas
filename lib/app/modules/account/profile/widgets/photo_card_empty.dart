import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';

class PhotoCardEmpty extends StatelessWidget {
  const PhotoCardEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Contenedor principal con borde personalizado

        CustomPaint(
          size: Size(100, 100), // Tamaño del contenedor
          painter: VerticalSplitBorderPainter(), // Pintor personalizado
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24), // Bordes redondeados
              // color: Colors.purple.withOpacity(0.1), // Fondo semitransparente
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(3.5),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: white,
                ),
                alignment: Alignment.center,
                child: Icon(
                  EstrellasIcons.user,
                  size: 44,
                  color: neutral900,
                ),
              ),
            ),
          ),
        ),

        // Ícono flotante de cámara
        Positioned(
          top: -10,
          right: -10,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: secondaryLight, // Fondo semitransparente
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Icon(
                EstrellasIcons.camera,
                size: 26,
                color: neutral900,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Pintor personalizado para dividir el borde verticalmente
class VerticalSplitBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double borderWidth = 4; // Grosor del borde

    // Crear el borde redondeado
    final borderRadius = BorderRadius.circular(20);
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(24));

    final paintRight = Paint()
      ..color = secondaryBase
      ..strokeWidth = borderWidth;
    canvas.clipRect(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRRect(rrect, paintRight);
    // Pintar la mitad izquierda (Color 1)
    final paintLeft = Paint()
      ..color = secondaryLight
      // ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;
    canvas.clipRect(Rect.fromLTWH(0, 0, size.width / 2, size.height));
    canvas.drawRRect(rrect, paintLeft);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
