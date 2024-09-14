import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF1FE371),
      surfaceTint: Color(0XFF10753A),
      onPrimary: Color(0xFFE5FFF6),
      primaryContainer: Color(0xFFE5FFF6),
      onPrimaryContainer: Color(0xFF10753A),
      secondary: Color(0xFF6A00F5),
      onSecondary: Color(0xFFF1E5FF),
      secondaryContainer: Color(0xFFF1E5FF),
      onSecondaryContainer: Color(0xFF3C1075),
      tertiary: Color(0xFFFF8A00),
      onTertiary: Color(0xFFF6A97D),
      tertiaryContainer: Color(0xFFF6A97D),
      onTertiaryContainer: Color(0xFF93370D),
      error: Color(0xFFF14438),
      onError: Color(0xFFFFE5E5),
      errorContainer: Color(0xFFFFE5E5),
      onErrorContainer: Color(0xFFCF1111),
      surface: Color(4294310651),
      onSurface: Color(4279704862),
      onSurfaceVariant: Color(4282468673),
      outline: Color(4285692272),
      outlineVariant: Color(4290890174),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281020723),
      inversePrimary: Color(0xFFE5FFF6),
      primaryFixed: Color(0xFFE5FFF6),
      onPrimaryFixed: Color(0xFF10753A),
      primaryFixedDim: Color(0xFFE5FFF6),
      onPrimaryFixedVariant: Color(0xFF10753A),
      secondaryFixed: Color(0xFFF1E5FF),
      onSecondaryFixed: Color(4280356679),
      secondaryFixedDim: Color(0xFFF1E5FF),
      onSecondaryFixedVariant: Color(0xFF6A00F5),
      tertiaryFixed: Color(0xFFF6A97D),
      onTertiaryFixed: Color(4281275648),
      tertiaryFixedDim: Color(0xFFF6A97D),
      onTertiaryFixedVariant: Color(4285282824),
      surfaceDim: Color(4292205532),
      surfaceBright: Color(4294310651),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916150),
      surfaceContainer: Color(4293521392),
      surfaceContainerHigh: Color(4293126634),
      surfaceContainerHighest: Color(4292797413),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4279586086),
      surfaceTint: Color(4281559360),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4283072596),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4282988913),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4286344102),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4284954116),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4288898611),
      onTertiaryContainer: Color(4294967295),
      error: Color(4285411369),
      onError: Color(4294967295),
      errorContainer: Color(4289355862),
      onErrorContainer: Color(4294967295),
      surface: Color(4294310651),
      onSurface: Color(4279704862),
      onSurfaceVariant: Color(4282205501),
      outline: Color(4284113241),
      outlineVariant: Color(4285889908),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281020723),
      inversePrimary: Color(4288337057),
      primaryFixed: Color(4283072596),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4281427773),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4286344102),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4284699276),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4288898611),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4286991901),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292205532),
      surfaceBright: Color(4294310651),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916150),
      surfaceContainer: Color(4293521392),
      surfaceContainerHigh: Color(4293126634),
      surfaceContainerHighest: Color(4292797413),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278200590),
      surfaceTint: Color(4281559360),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4279586086),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280817486),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282988913),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4281932288),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4284954116),
      onTertiaryContainer: Color(4294967295),
      error: Color(4282650635),
      onError: Color(4294967295),
      errorContainer: Color(4285411369),
      onErrorContainer: Color(4294967295),
      surface: Color(4294310651),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280231455),
      outline: Color(4282205501),
      outlineVariant: Color(4282205501),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281020723),
      inversePrimary: Color(4290771909),
      primaryFixed: Color(4279586086),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278203668),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282988913),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4281541209),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4284954116),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4282917632),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292205532),
      surfaceBright: Color(4294310651),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916150),
      surfaceContainer: Color(4293521392),
      surfaceContainerHigh: Color(4293126634),
      surfaceContainerHighest: Color(4292797413),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4288337057),
      surfaceTint: Color(4288337057),
      onPrimary: Color(4278204695),
      primaryContainer: Color(4279914794),
      onPrimaryContainer: Color(4290113980),
      secondary: Color(4291869950),
      onSecondary: Color(4281738845),
      secondaryContainer: Color(4283252085),
      onSecondaryContainer: Color(4293516799),
      tertiary: Color(4294948735),
      onTertiary: Color(4283311616),
      tertiaryContainer: Color(4285282824),
      onTertiaryContainer: Color(4294958276),
      error: Color(4294948010),
      onError: Color(4283833880),
      errorContainer: Color(4285740076),
      onErrorContainer: Color(4294957781),
      surface: Color(4279112725),
      onSurface: Color(4292797413),
      onSurfaceVariant: Color(4290890174),
      outline: Color(4287337353),
      outlineVariant: Color(4282468673),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797413),
      inversePrimary: Color(4281559360),
      primaryFixed: Color(4290113980),
      onPrimaryFixed: Color(4278198538),
      primaryFixedDim: Color(4288337057),
      onPrimaryFixedVariant: Color(4279914794),
      secondaryFixed: Color(4293516799),
      onSecondaryFixed: Color(4280356679),
      secondaryFixedDim: Color(4291869950),
      onSecondaryFixedVariant: Color(4283252085),
      tertiaryFixed: Color(4294958276),
      onTertiaryFixed: Color(4281275648),
      tertiaryFixedDim: Color(4294948735),
      onTertiaryFixedVariant: Color(4285282824),
      surfaceDim: Color(4279112725),
      surfaceBright: Color(4281612859),
      surfaceContainerLowest: Color(4278783760),
      surfaceContainerLow: Color(4279704862),
      surfaceContainer: Color(4279968034),
      surfaceContainerHigh: Color(4280625964),
      surfaceContainerHighest: Color(4281349687),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4288600485),
      surfaceTint: Color(4288337057),
      onPrimary: Color(4278196999),
      primaryContainer: Color(4284915055),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4292133375),
      onSecondary: Color(4280027457),
      secondaryContainer: Color(4288251845),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294950282),
      onTertiary: Color(4280750080),
      tertiaryContainer: Color(4291068492),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281533443),
      errorContainer: Color(4291591025),
      onErrorContainer: Color(4278190080),
      surface: Color(4279112725),
      onSurface: Color(4294376701),
      onSurfaceVariant: Color(4291153346),
      outline: Color(4288521627),
      outlineVariant: Color(4286481788),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797413),
      inversePrimary: Color(4279980587),
      primaryFixed: Color(4290113980),
      onPrimaryFixed: Color(4278195461),
      primaryFixedDim: Color(4288337057),
      onPrimaryFixedVariant: Color(4278402843),
      secondaryFixed: Color(4293516799),
      onSecondaryFixed: Color(4279632700),
      secondaryFixedDim: Color(4291869950),
      onSecondaryFixedVariant: Color(4282133603),
      tertiaryFixed: Color(4294958276),
      onTertiaryFixed: Color(4280290304),
      tertiaryFixedDim: Color(4294948735),
      onTertiaryFixedVariant: Color(4283837184),
      surfaceDim: Color(4279112725),
      surfaceBright: Color(4281612859),
      surfaceContainerLowest: Color(4278783760),
      surfaceContainerLow: Color(4279704862),
      surfaceContainer: Color(4279968034),
      surfaceContainerHigh: Color(4280625964),
      surfaceContainerHighest: Color(4281349687),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4293984237),
      surfaceTint: Color(4288337057),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4288600485),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294965759),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4292133375),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294966008),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4294950282),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965752),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279112725),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294311410),
      outline: Color(4291153346),
      outlineVariant: Color(4291153346),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797413),
      inversePrimary: Color(4278202899),
      primaryFixed: Color(4290442688),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4288600485),
      onPrimaryFixedVariant: Color(4278196999),
      secondaryFixed: Color(4293780223),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4292133375),
      onSecondaryFixedVariant: Color(4280027457),
      tertiaryFixed: Color(4294959565),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4294950282),
      onTertiaryFixedVariant: Color(4280750080),
      surfaceDim: Color(4279112725),
      surfaceBright: Color(4281612859),
      surfaceContainerLowest: Color(4278783760),
      surfaceContainerLow: Color(4279704862),
      surfaceContainer: Color(4279968034),
      surfaceContainerHigh: Color(4280625964),
      surfaceContainerHighest: Color(4281349687),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
