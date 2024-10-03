import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class SavedPlacesScreen extends StatefulWidget {
  const SavedPlacesScreen({super.key});

  @override
  State<SavedPlacesScreen> createState() => _SavedPlacesScreenState();
}

class _SavedPlacesScreenState extends State<SavedPlacesScreen> {
  TextEditingController _controller = TextEditingController();
  // list to hold saved placed
  List<String> _savedPlaces = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          TTexts.riderSavedPlacesAppBarTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TTexts.riderSavedPlacesSubTitle,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                TextFormField(
                  keyboardType: TextInputType.streetAddress,
                  controller: _controller,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        _controller.clear();
                      },
                      icon: const Icon(
                        Iconsax.close_circle,
                        size: 18,
                        color: TColors.grey,
                      ),
                    ),
                    filled: true,
                    fillColor:
                        TColors.containerBackgroundColor.withOpacity(0.6),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: TColors.primary,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: TColors.grey,
                      ),
                    ),
                  ),
                  onFieldSubmitted: (value) {
                    setState(() {
                      if (value.isNotEmpty) {
                        // Adds the place to the list
                        _savedPlaces.add(value);
                        _controller.clear();
                      }
                    });
                  },
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                // Checks if the list is empty
                _savedPlaces.isEmpty
                    ? const Center(
                        child: Text(TTexts.riderSavedPlacesListCheckerTitle),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: _savedPlaces.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: const Icon(Iconsax.home),
                            title: Text(
                              _savedPlaces[index],
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            subtitle: Text(
                              _savedPlaces[index],
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          );
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
