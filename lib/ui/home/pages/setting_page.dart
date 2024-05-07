import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../../data/datasources/auth_local_datasource.dart';
import '../../auth/bloc/logout/logout_bloc.dart';
import '../../auth/pages/login_page.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(18.0),
        children: [
          const Text(
            'Account',
            style: TextStyle(
              color: AppColors.primary,
            ),
          ),
          const SpaceHeight(4.0),
          BlocConsumer<LogoutBloc, LogoutState>(
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
              return state.maybeWhen(orElse: () {
                return ListTile(
                  onTap: () {
                    context.read<LogoutBloc>().add(const LogoutEvent.logout());
                  },
                  title: const Text('Logout'),
                  trailing: const Icon(Icons.chevron_right),
                );
              }, loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              });
            },
          ),
          const Divider(
            color: AppColors.stroke,
            height: 2.0,
          ),
          ListTile(
            onTap: () {},
            title: const Text('Password'),
            trailing: const Icon(Icons.chevron_right),
          ),
          const Divider(
            color: AppColors.stroke,
            height: 2.0,
          ),
          ListTile(
            onTap: () {},
            title: const Text('Language'),
            trailing: const Icon(Icons.chevron_right),
          ),
          const Divider(
            color: AppColors.stroke,
            height: 2.0,
          ),
          const SpaceHeight(40.0),
          const Text(
            'Preferences',
            style: TextStyle(
              color: AppColors.primary,
            ),
          ),
          const SpaceHeight(4.0),
          ListTile(
            onTap: () {},
            title: const Text('Theme'),
            trailing: const Icon(Icons.chevron_right),
          ),
          const Divider(
            color: AppColors.stroke,
            height: 2.0,
          ),
          ListTile(
            onTap: () {
              // context.push(const NotificationPage());
            },
            title: const Text('Notifications'),
            trailing: const Icon(Icons.chevron_right),
          ),
          const Divider(
            color: AppColors.stroke,
            height: 2.0,
          ),
          ListTile(
            onTap: () {},
            title: const Text('Attendance'),
            trailing: const Icon(Icons.chevron_right),
          ),
          const Divider(
            color: AppColors.stroke,
            height: 2.0,
          ),
          const SpaceHeight(40.0),
          const Text(
            'Support',
            style: TextStyle(
              color: AppColors.primary,
            ),
          ),
          const SpaceHeight(4.0),
          ListTile(
            onTap: () {},
            title: const Text('Terms of Service & Privacy'),
            trailing: const Icon(Icons.chevron_right),
          ),
          const Divider(
            color: AppColors.stroke,
            height: 2.0,
          ),
          ListTile(
            onTap: () {},
            title: const Text('Clear Cache'),
            trailing: const Icon(Icons.chevron_right),
          ),
          const Divider(
            color: AppColors.stroke,
            height: 2.0,
          ),
        ],
      ),
    );
  }
}
