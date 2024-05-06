import 'package:fic16_absensi/data/datasources/auth_local_datasource.dart';
import 'package:flutter/material.dart';
import 'package:fic16_absensi/core/core.dart';
import 'package:fic16_absensi/ui/auth/bloc/logout/logout_bloc.dart';
import 'package:fic16_absensi/ui/auth/pages/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting Page'),
      ),
      body: Center(
          child: BlocConsumer<LogoutBloc, LogoutState>(
        listener: (context, state) {
          state.maybeMap(
            orElse: () {},
            success: (_) {
              context.pushReplacement(const LoginPage());
              AuthLocalDatasource().removeAuthData();
            },
            error: (value) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(value.error),
                  backgroundColor: AppColors.red,
                ),
              );
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return Button.filled(
                onPressed: () {
                  context.read<LogoutBloc>().add(const LogoutEvent.logout());
                },
                label: 'Logout',
              );
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        },
      )),
    );
  }
}
