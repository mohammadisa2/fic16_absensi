import 'package:flutter/material.dart';

import '../../../core/core.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Assets.images.bgHome.provider(),
              alignment: Alignment.topCenter,
            ),
          ),
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const Text(
                'Profile',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SpaceHeight(45.0),
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image.network(
                          'https://i.pinimg.com/originals/1b/14/53/1b14536a5f7e70664550df4ccaa5b231.jpg',
                          width: 120.0,
                          height: 120.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: Assets.icons.edit.svg(),
                    ),
                  ],
                ),
              ),
              const SpaceHeight(45.0),
              const Text(
                'hera@geoface.id | +6285806391116',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SpaceHeight(140.0),
              const Text(
                'Account',
                style: TextStyle(
                  color: AppColors.primary,
                ),
              ),
              const SpaceHeight(4.0),
              ListTile(
                onTap: () {},
                title: const Text('Edit Profile'),
                trailing: const Icon(Icons.chevron_right),
              ),
              const Divider(
                color: AppColors.stroke,
                height: 2.0,
              ),
              ListTile(
                onTap: () {},
                title: const Text('Jabatan'),
                trailing: const Icon(Icons.chevron_right),
              ),
              const Divider(
                color: AppColors.stroke,
                height: 2.0,
              ),
              ListTile(
                onTap: () {},
                title: const Text('Perangkat Terdaftar'),
                trailing: const Icon(Icons.chevron_right),
              ),
              const Divider(
                color: AppColors.stroke,
                height: 2.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
