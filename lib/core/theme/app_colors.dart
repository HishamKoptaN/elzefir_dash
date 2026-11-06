import 'package:flutter/material.dart';

abstract class AppColors {
  const AppColors();
  static const Color success = Color(0xFF27AE60);
  static const Color danger = Color(0xFFEB5757);
  static const Color warning = Color(0xFFE2B93B);
  Color get primary;
  Color get primaryLight;
  Color get onPrimary;
  Color get background;
  Color get surface;
  Color get textPrimary;
  Color get textSecondary;
}

class LightColors extends AppColors {
  const LightColors();
  @override
  Color get primary {
    return const Color(0xFF002B49);
  }

  @override
  Color get primaryLight {
    return const Color(0xFFD7CCC8);
  }

  @override
  Color get onPrimary {
    return Colors.white;
  }

  @override
  Color get background {
    return const Color(0xFFF5EAD8);
  }

  @override
  Color get surface {
    return Colors.white;
  }

  @override
  Color get textPrimary {
    return const Color(0xFF212121);
  }

  @override
  Color get textSecondary {
    return const Color(0xFF757575);
  }
}

class DarkColors extends AppColors {
  const DarkColors();

  @override
  Color get primary {
    return const Color(0xFFD7CCC8);
  }

  @override
  Color get primaryLight {
    return const Color(0xFFD7CCC8);
  }

  @override
  Color get onPrimary {
    return Colors.black;
  }

  @override
  Color get background {
    return const Color(0xFF121212);
  }

  @override
  Color get surface {
    return const Color(0xFF1E1E1E);
  }

  @override
  Color get textPrimary {
    return const Color(0xFFECEFF1);
  }

  @override
  Color get textSecondary {
    return const Color(0xFFB0BEC5);
  }
}
