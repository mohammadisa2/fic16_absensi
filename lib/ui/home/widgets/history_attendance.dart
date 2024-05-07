import 'package:flutter/material.dart';

import '../../../core/assets/assets.dart';
import '../../../core/components/components.dart';
import '../../../core/constants/colors.dart';

class HistoryAttendance extends StatelessWidget {
  const HistoryAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Absensi Datang',
                style: TextStyle(
                  fontSize: 16.0,
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '08:00',
                style: TextStyle(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          const SpaceHeight(4.0),
          Row(
            children: [
              Assets.icons.location.svg(),
              const SpaceWidth(8.0),
              const Text(
                'Kantor',
                style: TextStyle(
                  color: AppColors.white,
                ),
              ),
              const Spacer(),
              const Text(
                '4 Maret 2024',
                style: TextStyle(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
