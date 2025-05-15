import 'package:bglory_rides/common/widgets/form/text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class TPasswordField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? padding;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final bool isLoading;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;

  const TPasswordField({
    Key? key,
    this.labelText,
    this.hintText,
    this.controller,
    this.padding,
    this.validator,
    this.onChanged,
    this.isLoading = false,
    this.focusNode,
    this.textInputAction,
    this.prefixIcon,
  }) : super(key: key);

  @override
  State<TPasswordField> createState() => _TPasswordFieldState();
}

class _TPasswordFieldState extends State<TPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TTextFormField(
      labelText: widget.labelText ?? 'Password',
      hintText: widget.hintText,
      controller: widget.controller,
      padding: widget.padding,
      validator: widget.validator,
      onChanged: widget.onChanged,
      isLoading: widget.isLoading,
      focusNode: widget.focusNode,
      textInputAction: widget.textInputAction,
      prefixIcon: widget.prefixIcon ?? const Icon(Icons.lock_outline),
      obscureText: _obscureText,
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
          color: TColors.darkGrey,
        ),
        onPressed: widget.isLoading ? null : () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      ),
    );
  }
}