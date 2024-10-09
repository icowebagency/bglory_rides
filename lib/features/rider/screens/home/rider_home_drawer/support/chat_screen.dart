import 'package:bglory_rides/routing/rider_routing.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../../../driver/screens/home/home-drawer/custom_chat_input.dart';

class RiderChatScreen extends StatefulWidget {
  const RiderChatScreen({Key? key}) : super(key: key);

  @override
  State<RiderChatScreen> createState() => _RiderChatScreenState();
}

class _RiderChatScreenState extends State<RiderChatScreen> {
  final types.User _user = const types.User(id: 'user_id');
  final List<types.Message> _messages = [];

  String formatTimestamp(DateTime dateTime) {
    final DateFormat formatter =
        DateFormat('h:mm a'); // Use any format you like
    return formatter.format(dateTime);
  }

  void _onSendPressed(types.PartialText message) {
    // Handle sending the message here
    setState(() {
      _messages.add(types.TextMessage(
        author: _user,
        id: DateTime.now().toString(),
        text: message.text,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    context.push(BGRiderRouteNames.riderCallUsScreen);
                  },
                  child: const CircleAvatar(
                    backgroundColor: TColors.primary,
                    child: Icon(
                      Iconsax.call_calling,
                      color: TColors.white,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Chat(
        timeFormat: DateFormat('h:mm a'),
        user: _user,
        messages: _messages,
        onSendPressed: _onSendPressed,
        customBottomWidget: CustomChatInput(
          isAttachmentUploading: false,
          onAttachmentPressed: () {
            // Handle attachment press
          },
          onSendPressed: (text) {
            _onSendPressed(types.PartialText(text: text));
          },
        ),
      ),
    );
  }
}
