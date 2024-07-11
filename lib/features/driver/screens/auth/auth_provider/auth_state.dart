import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthState {
  final bool isLoading;
  final TextEditingController textFieldController;
  final GlobalKey<FormState> formKey;
  final GoRouter _router;
  final int pageIndex;
  final DefaultTabController? tabController;
  final bool Function()? validate;

  AuthState(
      {required this.isLoading,
      required this.textFieldController,
      required this.formKey,
      required GoRouter router,
      this.tabController,
      required this.pageIndex,
      this.validate})
      : _router = router;

  AuthState copyWith({
    bool? isLoading,
    TextEditingController? textFieldController,
    GlobalKey<FormState>? formKey,
    GoRouter? router,
    int? pageIndex,
    DefaultTabController? tabController,
    bool Function()? validate,
  }) =>
      AuthState(
        isLoading: isLoading ?? this.isLoading,
        textFieldController: textFieldController ?? this.textFieldController,
        formKey: formKey ?? this.formKey,
        router: router ?? _router,
        tabController: tabController ?? this.tabController,
        pageIndex: pageIndex ?? this.pageIndex,
        validate: validate ?? this.validate,
      );
}
