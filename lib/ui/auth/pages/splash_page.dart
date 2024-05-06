import 'package:flutter/material.dart';
import 'package:fic16_absensi/data/datasources/auth_local_datasource.dart';

import '../../../core/core.dart';
import '../../home/pages/main_page.dart';
import 'login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    // Future.delayed(
    //   const Duration(seconds: 2),
    //   () => context.pushReplacement(const LoginPage()),
    // );
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: FutureBuilder(
        future: AuthLocalDatasource().isAuth(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Column(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Assets.images.logoWhite.image(),
                ),
                const Spacer(),
                Assets.images.logoCodeWithBahri.image(height: 70),
                const SpaceHeight(20.0),
              ],
            );
          }
          if (snapshot.hasData) {
            // ignore: unrelated_type_equality_checks
            if (snapshot.data! == true) {
              Future.delayed(
                const Duration(seconds: 2),
                () => context.pushReplacement(const MainPage()),
              );
            } else {
              Future.delayed(
                const Duration(seconds: 2),
                () => context.pushReplacement(const LoginPage()),
              );
            }
          }
          return Column(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Assets.images.logoWhite.image(),
              ),
              const Spacer(),
              Assets.images.logoCodeWithBahri.image(height: 70),
              const SpaceHeight(20.0),
            ],
          );
        },
      ),
    );
  }
}
