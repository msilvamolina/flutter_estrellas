import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:pinput/pinput.dart';

class CustomPinInputCode extends StatefulWidget {
  const CustomPinInputCode({
    Key? key,
    required this.length,
    this.validator,
    this.onCompleted,
    this.onChanged,
  }) : super(key: key);

  final int length;
  final String? Function(String?)? validator;
  final void Function(String)? onCompleted;
  final void Function(String)? onChanged;

  @override
  State<CustomPinInputCode> createState() => _CustomPinInputCodeState();
}

class _CustomPinInputCodeState extends State<CustomPinInputCode> {
  late final TextEditingController pinController;
  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    pinController = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = secondaryBase;
    const fillColor = Color.fromRGBO(243, 246, 249, 0);

    // Calcula el ancho de cada input para que se ajuste al ancho total de la pantalla
    final screenWidth = MediaQuery.of(context).size.width;
    final inputWidth = (screenWidth - 60) /
        widget.length; // Ajusta el "- 60" para aumentar el padding entre campos

    final defaultPinTheme = PinTheme(
      width: inputWidth,
      height: 70, // Ajusta la altura para hacer los inputs más altos
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            16), // Usa un radio de 16 en todos los estados
        border:
            Border.all(color: neutral600, width: 1), // Borde neutral de ancho 1
      ),
    );

    return Form(
      key: formKey,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Pinput(
          length: widget.length,
          autofocus: true,
          controller: pinController,
          focusNode: focusNode,
          defaultPinTheme: defaultPinTheme,
          separatorBuilder: (index) =>
              const SizedBox(width: 10), // Aumenta el espacio entre campos
          validator: widget.validator,
          errorTextStyle: const TextStyle(
            color: error900, // Cambia el color del texto de error a error500
            fontSize: 16,
          ),
          hapticFeedbackType: HapticFeedbackType.lightImpact,
          onCompleted: widget.onCompleted,
          onChanged: widget.onChanged,
          cursor: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 9),
                width: 22,
                height: 1,
                color: focusedBorderColor,
              ),
            ],
          ),
          focusedPinTheme: defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                  color: focusedBorderColor,
                  width: 1.5), // Borde de ancho 1.5 en foco
            ),
          ),
          submittedPinTheme: defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
              color: fillColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                  color: focusedBorderColor,
                  width: 1.5), // Borde de ancho 1.5 en enviado
            ),
          ),
          errorPinTheme: defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                  color: error900, width: 1), // Borde de ancho 1 en error
            ),
          ),
        ),
      ),
    );
  }
}
