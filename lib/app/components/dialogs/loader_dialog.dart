import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:lottie/lottie.dart';

class LoaderDialog extends StatelessWidget {
  const LoaderDialog({super.key, this.title, this.message});

  final String? title;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/loader_splash.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/lotties/Loader.json',
              ),
              if (title != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    title!,
                    textAlign: TextAlign.center,
                    style: TypographyStyle.bodyRegularLarge,
                  ),
                ),
              if (title != null && message != null)
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    message!,
                    textAlign: TextAlign.center,
                    style: TypographyStyle.bodyRegularSmall
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
