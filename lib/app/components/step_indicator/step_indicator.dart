import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../themes/styles/colors.dart';

class StepIndicator extends StatelessWidget {
  const StepIndicator({
    required this.currentStep,
    required this.totalSteps,
    super.key,
  });

  final int currentStep;
  final int totalSteps;
  @override
  Widget build(BuildContext context) {
    Color colorStep = neutral300;
    return Row(
      children: [
        for (int index = 0; index < totalSteps; index++) ...[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: currentStep > index ? secondaryBase : colorStep,
                  borderRadius: BorderRadius.circular(16)),
              width: double.infinity,
              height: 4,
            ),
          ),
          SizedBox(width: 8),
        ],
      ],
    );
  }
}
