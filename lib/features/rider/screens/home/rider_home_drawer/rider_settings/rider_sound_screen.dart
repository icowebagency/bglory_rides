import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';

class RiderSoundScreen extends StatefulWidget {
  const RiderSoundScreen({super.key});

  @override
  State<RiderSoundScreen> createState() => _RiderSoundScreenState();
}

class _RiderSoundScreenState extends State<RiderSoundScreen> {
  int _selectedRadio = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(TTexts.soundScreenAppBarTitle),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: TColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Email
              ListTile(
                onTap: () {},
                title: Text(
                  TTexts.soundScreenANoneTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                trailing: Radio(
                  activeColor: TColors.primary,
                  value: 1,
                  groupValue: _selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      _selectedRadio = value!;
                    });
                  },
                ),
              ),
              Divider(
                thickness: 1,
                color: TColors.softGrey.withOpacity(0.7),
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(height: 10),
              ListTile(
                onTap: () {},
                title: Text(
                  TTexts.soundScreenAuroraTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                trailing: Radio(
                  activeColor: TColors.primary,
                  value: 1,
                  groupValue: _selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      _selectedRadio = value!;
                    });
                  },
                ),
              ),
              Divider(
                thickness: 1,
                color: TColors.softGrey.withOpacity(0.7),
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(height: 10),
              ListTile(
                onTap: () {},
                title: Text(
                  TTexts.soundScreenBamboTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                trailing: Radio(
                  activeColor: TColors.primary,
                  value: 1,
                  groupValue: _selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      _selectedRadio = value!;
                    });
                  },
                ),
              ),
              Divider(
                thickness: 1,
                color: TColors.softGrey.withOpacity(0.7),
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(height: 10),
              ListTile(
                onTap: () {},
                title: Text(
                  TTexts.soundScreenChordTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                trailing: Radio(
                  activeColor: TColors.primary,
                  value: 1,
                  groupValue: _selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      _selectedRadio = value!;
                    });
                  },
                ),
              ),
              Divider(
                thickness: 1,
                color: TColors.softGrey.withOpacity(0.7),
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: TColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  onTap: () {},
                  title: Text(
                    TTexts.soundScreenCirclesTitle,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  trailing: Radio(
                    activeColor: TColors.primary,
                    value: 1,
                    groupValue: _selectedRadio,
                    onChanged: (value) {
                      setState(() {
                        _selectedRadio = value!;
                      });
                    },
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: TColors.softGrey.withOpacity(0.7),
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(height: 10),
              ListTile(
                onTap: () {},
                title: Text(
                  TTexts.soundScreenHelloTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                trailing: Radio(
                  activeColor: TColors.primary,
                  value: 1,
                  groupValue: _selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      _selectedRadio = value!;
                    });
                  },
                ),
              ),
              Divider(
                thickness: 1,
                color: TColors.softGrey.withOpacity(0.7),
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(height: 10),
              ListTile(
                onTap: () {},
                title: Text(
                  TTexts.soundScreenInputTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                trailing: Radio(
                  activeColor: TColors.primary,
                  value: 1,
                  groupValue: _selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      _selectedRadio = value!;
                    });
                  },
                ),
              ),

              const SizedBox(height: 10),
              // Push
            ],
          ),
        ),
      ),
    );
  }
}
