// ignore_for_file: use_build_context_synchronously

import 'package:fic16_absensi/ui/home/pages/notes_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fic16_absensi/core/helper/radius_calculate.dart';
import 'package:fic16_absensi/data/datasources/auth_local_datasource.dart';
import 'package:fic16_absensi/ui/home/bloc/is_checkedin/is_checkedin_bloc.dart';
import 'package:fic16_absensi/ui/home/pages/attendance_checkin_page.dart';
import 'package:fic16_absensi/ui/home/pages/attendance_checkout_page.dart';
import 'package:fic16_absensi/ui/home/pages/permission_page.dart';
import 'package:fic16_absensi/ui/home/pages/register_face_attendance_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
// import 'package:safe_device/safe_device.dart';

import '../../../core/core.dart';
import '../widgets/menu_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? nameProfile;
  String? faceEmbedding;
  double? latitudeCompany;
  double? longitudeCompany;
  double? radiusCompany;
  String? timeInCompany;
  String? timeOutCompany;

  @override
  void initState() {
    context.read<IsCheckedinBloc>().add(const IsCheckedinEvent.isCheckedIn());
    super.initState();
    getCurrentPosition();
    _initializeData();
  }

  Future<void> _initializeData() async {
    final authData = await AuthLocalDatasource().getAuthData();
    if (authData != null && authData.company != null) {
      latitudeCompany = double.tryParse(authData.company!.latitude ?? '');
      longitudeCompany = double.tryParse(authData.company!.longitude ?? '');
      radiusCompany = double.tryParse(authData.company!.radiusKm ?? '');
      timeInCompany = authData.company!.timeIn;
      timeOutCompany = authData.company!.timeOut;
      faceEmbedding = authData.user!.faceEmbedding;
    }

    if (authData != null && authData.user != null) {
      nameProfile = authData.user!.name;
    }
  }

  double? latitude;
  double? longitude;

  Future<void> getCurrentPosition() async {
    try {
      Location location = Location();

      bool serviceEnabled;
      PermissionStatus permissionGranted;
      LocationData locationData;

      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          return;
        }
      }

      permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      locationData = await location.getLocation();
      latitude = locationData.latitude;
      longitude = locationData.longitude;

      setState(() {});
    } on PlatformException catch (e) {
      if (e.code == 'IO_ERROR') {
        debugPrint(
            'A network error occurred trying to lookup the supplied coordinates: ${e.message}');
      } else {
        debugPrint('Failed to lookup coordinates: ${e.message}');
      }
    } catch (e) {
      debugPrint('An unknown error occurred: $e');
    }
  }

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
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.network(
                      'https://i.pinimg.com/originals/1b/14/53/1b14536a5f7e70664550df4ccaa5b231.jpg',
                      width: 48.0,
                      height: 48.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SpaceWidth(12.0),
                  Expanded(
                    child: Text(
                      'Hello, ${nameProfile ?? 'Hello, Chopper Sensei'}',
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: AppColors.white,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Assets.icons.notificationRounded.svg(),
                  ),
                ],
              ),
              const SpaceHeight(24.0),
              Container(
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    Text(
                      DateTime.now().toFormattedTime(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32.0,
                        color: AppColors.primary,
                      ),
                    ),
                    Text(
                      DateTime.now().toFormattedDate(),
                      style: const TextStyle(
                        color: AppColors.grey,
                        fontSize: 12.0,
                      ),
                    ),
                    const SpaceHeight(18.0),
                    const Divider(),
                    const SpaceHeight(30.0),
                    Text(
                      DateTime.now().toFormattedDate(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.grey,
                      ),
                    ),
                    const SpaceHeight(6.0),
                    Text(
                      "${timeInCompany} - ${timeOutCompany}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SpaceHeight(80.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    BlocBuilder<IsCheckedinBloc, IsCheckedinState>(
                      builder: (context, state) {
                        final isCheckIn = state.maybeWhen(
                          orElse: () => false,
                          success: (data) => data.isCheckedin,
                        );

                        print("Halo anda sudah: $isCheckIn");

                        return MenuButton(
                          label: 'Datang',
                          iconPath: Assets.icons.menu.datang.path,
                          onPressed: () async {
                            // Deteksi lokasi palsu

                            // masuk page checkin

                            final distanceKm =
                                RadiusCalculate.calculateDistance(
                              latitude ?? 0.0,
                              longitude ?? 0.0,
                              double.parse(latitudeCompany.toString()),
                              double.parse(longitudeCompany.toString()),
                            );

                            final position =
                                await Geolocator.getCurrentPosition();

                            if (position.isMocked) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Anda menggunakan lokasi palsu'),
                                  backgroundColor: AppColors.red,
                                ),
                              );
                              return;
                            }

                            if (distanceKm >
                                double.parse(radiusCompany.toString())) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Anda diluar jangkauan absen'),
                                  backgroundColor: AppColors.red,
                                ),
                              );
                              return;
                            }

                            if (isCheckIn) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Anda sudah checkin'),
                                  backgroundColor: AppColors.red,
                                ),
                              );
                            } else {
                              context.push(const AttendanceCheckinPage());
                            }
                          },
                        );
                      },
                    ),
                    BlocBuilder<IsCheckedinBloc, IsCheckedinState>(
                      builder: (context, state) {
                        final isCheckout = state.maybeWhen(
                          orElse: () => false,
                          success: (data) => data.isCheckedout,
                        );
                        final isCheckIn = state.maybeWhen(
                          orElse: () => false,
                          success: (data) => data.isCheckedin,
                        );
                        return MenuButton(
                          label: 'Pulang',
                          iconPath: Assets.icons.menu.pulang.path,
                          onPressed: () async {
                            final distanceKm =
                                RadiusCalculate.calculateDistance(
                              latitude ?? 0.0,
                              longitude ?? 0.0,
                              double.parse(latitudeCompany.toString()),
                              double.parse(longitudeCompany.toString()),
                            );
                            final position =
                                await Geolocator.getCurrentPosition();

                            if (position.isMocked) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Anda menggunakan lokasi palsu'),
                                  backgroundColor: AppColors.red,
                                ),
                              );
                              return;
                            }

                            print('jarak radius:  $distanceKm');

                            if (distanceKm >
                                double.parse(radiusCompany.toString())) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Anda diluar jangkauan absen'),
                                  backgroundColor: AppColors.red,
                                ),
                              );
                              return;
                            }
                            if (!isCheckIn) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Anda belum checkin'),
                                  backgroundColor: AppColors.red,
                                ),
                              );
                            } else if (isCheckout) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Anda sudah checkout'),
                                  backgroundColor: AppColors.red,
                                ),
                              );
                            } else {
                              context.push(const AttendanceCheckoutPage());
                            }
                          },
                        );
                      },
                    ),
                    MenuButton(
                      label: 'Izin',
                      iconPath: Assets.icons.menu.izin.path,
                      onPressed: () {
                        context.push(const PermissionPage());
                      },
                    ),
                    MenuButton(
                      label: 'Catatan',
                      iconPath: Assets.icons.menu.catatan.path,
                      onPressed: () {
                        context.push(const NotesPage());
                      },
                    ),
                  ],
                ),
              ),
              const SpaceHeight(24.0),
              faceEmbedding != null
                  ? BlocBuilder<IsCheckedinBloc, IsCheckedinState>(
                      builder: (context, state) {
                        final isCheckout = state.maybeWhen(
                          orElse: () => false,
                          success: (data) => data.isCheckedout,
                        );
                        final isCheckIn = state.maybeWhen(
                          orElse: () => false,
                          success: (data) => data.isCheckedin,
                        );
                        return Button.filled(
                          onPressed: () async {
                            final distanceKm =
                                RadiusCalculate.calculateDistance(
                              latitude ?? 0.0,
                              longitude ?? 0.0,
                              double.parse(latitudeCompany.toString()),
                              double.parse(longitudeCompany.toString()),
                            );

                            final position =
                                await Geolocator.getCurrentPosition();

                            if (position.isMocked) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Anda menggunakan lokasi palsu'),
                                  backgroundColor: AppColors.red,
                                ),
                              );
                              return;
                            }

                            print('jarak radius:  $distanceKm');

                            if (distanceKm >
                                double.parse(radiusCompany.toString())) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Anda diluar jangkauan absen'),
                                  backgroundColor: AppColors.red,
                                ),
                              );
                              return;
                            }

                            if (!isCheckIn) {
                              context.push(const AttendanceCheckinPage());
                            } else if (!isCheckout) {
                              context.push(const AttendanceCheckoutPage());
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Anda sudah checkout'),
                                  backgroundColor: AppColors.red,
                                ),
                              );
                            }

                            // context.push(const SettingPage());
                          },
                          label: 'Attendance Using Face ID',
                          icon: Assets.icons.attendance.svg(),
                          color: AppColors.primary,
                        );
                      },
                    )
                  : Button.filled(
                      onPressed: () {
                        showBottomSheet(
                          backgroundColor: AppColors.white,
                          context: context,
                          builder: (context) => Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(
                                  width: 60.0,
                                  height: 8.0,
                                  child: Divider(color: AppColors.lightSheet),
                                ),
                                const CloseButton(),
                                const Center(
                                  child: Text(
                                    'Oops !',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24.0,
                                    ),
                                  ),
                                ),
                                const SpaceHeight(4.0),
                                const Center(
                                  child: Text(
                                    'Aplikasi ingin mengakses Kamera',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                                const SpaceHeight(36.0),
                                Button.filled(
                                  onPressed: () => context.pop(),
                                  label: 'Tolak',
                                  color: AppColors.secondary,
                                ),
                                const SpaceHeight(16.0),
                                Button.filled(
                                  onPressed: () {
                                    context.pop();
                                    context.push(
                                        const RegisterFaceAttendencePage());
                                  },
                                  label: 'Izinkan',
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      label: 'Attendance Using Face ID',
                      icon: Assets.icons.attendance.svg(),
                      color: AppColors.red,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
