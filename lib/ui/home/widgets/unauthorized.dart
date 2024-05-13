import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../auth/pages/login_page.dart';

SnackBar buildErrorSnackbar(String message, BuildContext context) {
  if (message == 'Unauthorized') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
    return SnackBar(
      content: Text(message),
      backgroundColor: AppColors.red,
    );
  } else {
    return SnackBar(
      content: Text(message),
      backgroundColor: AppColors.red,
    );
  }
}
