import 'package:bglory_rides/features/driver/data/repository/driver_repository.dart';
import 'package:bglory_rides/features/driver/screens/auth/auth_provider/auth_state.dart';
import 'package:bglory_rides/routing/driver_routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class DriverAuthStateNotifer extends StateNotifier<AuthState> {
  final DriverRepositoryContract driverRepositoryContract;

  bool Function()? validate;

  DriverAuthStateNotifer(
      {required this.driverRepositoryContract, required Ref ref})
      : super(
          AuthState(
            isLoading: false,
            textFieldController: TextEditingController(),
            formKey: GlobalKey<FormState>(),
            router: DriverRouting.router,
            pageIndex: 0,
          ),
        );

  void setPageController({required TabController controller}) {
    controller.removeListener(_clearTextField);
    controller.addListener(_clearTextField);
  }

  void _clearTextField() {
    state.textFieldController.clear();
  }

  void updatePageIndicator(int index) {
    state = state.copyWith(pageIndex: index);
  }

  Future<bool> onAuthAction({required Map<String, String> target});
}
