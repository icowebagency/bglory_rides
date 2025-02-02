import 'dart:io';

import 'package:bglory_rides/common/widgets/save_button_widget.dart';
import 'package:bglory_rides/features/driver/general_widgets/outlined_button_widget.dart';
import 'package:bglory_rides/features/rider/screens/rider_verification/verification_providers/verification_notifier.dart';
import 'package:bglory_rides/routing/rider_routing.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../data/provider/camera/camera_notifier.dart';

class RiderProfilePhotoUploadScreen extends ConsumerStatefulWidget {
  const RiderProfilePhotoUploadScreen({super.key});

  @override
  ConsumerState<RiderProfilePhotoUploadScreen> createState() =>
      _RiderProfilePhotoUploadScreenState();
}

class _RiderProfilePhotoUploadScreenState
    extends ConsumerState<RiderProfilePhotoUploadScreen> with WidgetsBindingObserver{

  File? _capturedImage;

  @override
  void initState() {
    super.initState();
    // _initializeCamera();
    WidgetsBinding.instance.addObserver(this);
    ref.read(cameraProvider.notifier).initializeCamera();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    // if(ref.read(cameraProvider).cameraController == null || !ref.read(cameraProvider).cameraController!.value.isInitialized) {
    //   return;
    // }
    if(state == AppLifecycleState.inactive) {
      ref.read(cameraProvider.notifier).dispose();
      return;
    }
    if(state == AppLifecycleState.resumed) {
      ref.read(cameraProvider.notifier).initializeCamera();
    }
  }

  @override
  void deactivate() {
    super.deactivate();
    ref.read(cameraProvider.notifier).dispose();

  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final state = ref.watch(verificationNotifier);
    final verNotifier = ref.watch(verificationNotifier.notifier);
    final cameraState = ref.watch(cameraProvider);
    final cameraNotifier = ref.read(cameraProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TTexts.riderProfilePictureUploadTitle,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 20,
                      ),
                ),
                Text(
                  TTexts.riderProfilePictureUploadSubTitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                if(state.profileImg.isEmpty) if(cameraState.cameraController == null || !cameraState.cameraController!.value.isInitialized)
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: TColors.primary,
                      ),
                      color: TColors.grey.withOpacity(0.5),
                    ),
                  )
                else
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: TColors.primary,
                      ),
                      color: TColors.grey.withOpacity(0.5),
                    ),
                    child: ClipRRect(
                      borderRadius:  BorderRadius.circular(20),
                      child: CameraPreview(cameraState.cameraController!),
                    ),
                  ),
                if(state.profileImg.isNotEmpty) Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: TColors.primary,
                    ),
                    color: TColors.grey.withOpacity(0.5),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.file(
                      _capturedImage!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                if(state.profileImg.isEmpty)Column(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.fiber_manual_record_rounded,
                        color: TColors.dark,
                        size: 14,
                      ),
                      title: Text(
                        TTexts.riderProfilePictureUploadTermsOne,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: TColors.error,
                            ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.fiber_manual_record_rounded,
                        color: TColors.dark,
                        size: 14,
                      ),
                      title: Text(
                        TTexts.riderProfilePictureUploadTermsTwo,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: TColors.error,
                            ),
                      ),
                    ),
                  ],
                ),
                if(state.profileImg.isNotEmpty) ...[
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    TTexts.riderProfilePictureUploadTermsAndCondition,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: TColors.error,
                    ),
                  ),
                ],
                if(state.profileImg.isEmpty)Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularIconContainer(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.15,
                      onTap: () {
                        cameraNotifier.toggleView();
                      },
                      color: TColors.grey.withOpacity(0.5),
                      icon: const Icon(
                        Icons.refresh,
                        color: TColors.dark,
                      ),
                    ),
                    const SizedBox(
                      width: TSizes.spaceBtwItems,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final picture = await cameraState.cameraController!.takePicture();
                        final img = File(picture.path);
                        _capturedImage = img;
                        verNotifier.updateProfile(img.path);
                        print(picture.path);
                        cameraNotifier.dispose();
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: const BoxDecoration(
                          color: TColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(
                            Iconsax.camera,
                            color: TColors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: TSizes.spaceBtwItems,
                    ),
                    CircularIconContainer(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.15,
                      onTap: () {},
                      color: TColors.grey.withOpacity(0.5),
                      icon: const Icon(
                        Iconsax.flash_slash,
                        color: TColors.dark,
                      ),
                    ),
                  ],
                ),
                if(state.profileImg.isNotEmpty) ...[
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SaveButtonWidget(
                  onTap: () {
                    context.push(BGRiderRouteNames.riderAddCard);
                  },
                  buttonText: TTexts.driverConfirm,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                OutlinedButtonWidget(
                  onTap: () {
                    cameraNotifier.initializeCamera();
                    verNotifier.updateProfile("");
                  },
                  buttonText: TTexts.generalRetakeTitle,
                ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CircularIconContainer extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final Icon icon;
  final VoidCallback onTap;

  const CircularIconContainer({
    Key? key,
    required this.height,
    required this.width,
    required this.color,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}
