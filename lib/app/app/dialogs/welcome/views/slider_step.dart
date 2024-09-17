import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../themes/styles/typography.dart';

class SliderStep extends StatefulWidget {
  const SliderStep({super.key});

  @override
  State<SliderStep> createState() => _SliderStepState();
}

class _SliderStepState extends State<SliderStep> {
  bool imageAnimation = false;
  bool titleAnimation = false;
  bool contentAnimation = false;

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        imageAnimation = true;
      });
    });
    Future.delayed(Duration(milliseconds: 800), () {
      setState(() {
        titleAnimation = true;
      });
    });
    Future.delayed(Duration(milliseconds: 1200), () {
      setState(() {
        contentAnimation = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: AnimatedScale(
            duration: Duration(milliseconds: 800),
            scale: imageAnimation ? 1 : 0.8,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 800),
              opacity: imageAnimation ? 1 : 0,
              child: Center(child: Image.asset('assets/images/welcome.png')),
            ),
          ),
        ),
        SizedBox(height: 16),
        AnimatedScale(
          duration: Duration(milliseconds: 800),
          scale: titleAnimation ? 1 : 0.8,
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 800),
            opacity: titleAnimation ? 1 : 0,
            child: Text(
              '¡Gana más con menos!',
              style: TypographyStyle.h3Mobile
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        SizedBox(height: 8),
        AnimatedScale(
          duration: Duration(milliseconds: 800),
          scale: titleAnimation ? 1 : 0.8,
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 800),
            opacity: contentAnimation ? 1 : 0,
            child: Text(
              'Te recompensamos con comisiones atractivas y fantásticos incentivos para que ganes más con menos esfuerzo.',
              style: TypographyStyle.bodyRegularMedium
                  .copyWith(fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }
}
