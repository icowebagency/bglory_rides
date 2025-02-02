import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthState {
  final bool isLoading;
  final TextEditingController textFieldController;
  final GoRouter _router;
  final int pageIndex;
  final bool Function()? validate;

  AuthState(
      {required this.isLoading,
        required this.textFieldController,
        required GoRouter router,
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
        router: router ?? _router,
        pageIndex: pageIndex ?? this.pageIndex,
        validate: validate ?? this.validate,
      );
}
