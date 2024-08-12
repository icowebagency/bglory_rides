import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/text_strings.dart';

class CustomChatInput extends StatefulWidget {
  final bool isAttachmentUploading;
  final VoidCallback? onAttachmentPressed;
  final void Function(String text) onSendPressed;

  const CustomChatInput({
    Key? key,
    this.isAttachmentUploading = false,
    this.onAttachmentPressed,
    required this.onSendPressed,
  }) : super(key: key);

  @override
  _CustomChatInputState createState() => _CustomChatInputState();
}

class _CustomChatInputState extends State<CustomChatInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: TColors.grey,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: TColors.primary),
                ),
                hintText: TTexts.chatHintText,
                hintStyle: Theme.of(context).textTheme.bodySmall,
                fillColor: TColors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onSubmitted: (text) {
                if (text.isNotEmpty) {
                  widget.onSendPressed(text);
                  _controller.clear();
                }
              },
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          // Container(
          //   width: 40,
          //   height: 40,
          //   decoration: const BoxDecoration(
          //     color: TColors.secondary,
          //     shape: BoxShape.circle,
          //   ),
          //   child: Center(
          //     child: IconButton(
          //       icon: const Icon(
          //         Iconsax.add,
          //         color: TColors.white,
          //         size: 20,
          //       ),
          //       onPressed: () {
          //         final text = _controller.text;
          //         if (text.isNotEmpty) {
          //           widget.onSendPressed(text);
          //           _controller.clear();
          //         }
          //       },
          //     ),
          //   ),
          // ),

          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: TColors.primary,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: IconButton(
                icon: const Icon(
                  Iconsax.send_1,
                  color: TColors.white,
                  size: 15,
                ),
                onPressed: () {
                  final text = _controller.text;
                  if (text.isNotEmpty) {
                    widget.onSendPressed(text);
                    _controller.clear();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
