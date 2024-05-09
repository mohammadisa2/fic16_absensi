// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../pages/location_page.dart';

class HistoryLocation extends StatelessWidget {
  final double latitude;
  final double longitude;
  final bool isAttendanceOut;

  const HistoryLocation({
    Key? key,
    required this.latitude,
    required this.longitude,
    this.isAttendanceOut = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: isAttendanceOut ? AppColors.primary : AppColors.red,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Assets.icons.location.svg(),
              const SpaceWidth(8.0),
              const Text(
                'Kantor',
                style: TextStyle(
                  fontSize: 16.0,
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SpaceHeight(4.0),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Status',
                style: TextStyle(
                  color: AppColors.white,
                ),
              ),
              Text(
                'Sesuai spot Absensi',
                style: TextStyle(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          const SpaceHeight(4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Latitude',
                style: TextStyle(
                  color: AppColors.white,
                ),
              ),
              Text(
                latitude.toString(),
                style: const TextStyle(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          const SpaceHeight(4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Longitude',
                style: TextStyle(
                  color: AppColors.white,
                ),
              ),
              Text(
                longitude.toString(),
                style: const TextStyle(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          const SpaceHeight(12.0),
          Button.filled(
            color: AppColors.white.withOpacity(0.5),
            onPressed: () {
              context.push(const LocationPage());
            },
            label: 'Lihat di Peta',
            fontSize: 14.0,
            height: 40.0,
          ),
        ],
      ),
    );
  }
}
