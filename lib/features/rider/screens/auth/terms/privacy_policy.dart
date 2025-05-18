import 'package:flutter/material.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:bglory_rides/utils/helpers/helper_functions.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Last Updated
            Text(
              'Last Updated: May 15, 2025',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Introduction
            Text(
              'Introduction',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: isDark ? TColors.white : TColors.black,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              'Welcome to BGlory Rides. We respect your privacy and are committed to protecting your personal data. This privacy policy will inform you how we look after your personal data when you use our services and tell you about your privacy rights and how the law protects you.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Data Collection
            Text(
              'Data We Collect',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: isDark ? TColors.white : TColors.black,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              'We collect personal information when you register for an account, such as your name, email address, phone number, and payment information. We may also collect information about your device, location, and usage patterns within the app.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            _buildBulletPoint(context, 'Profile information: Name, photo, contact details'),
            _buildBulletPoint(context, 'Verification details: Government ID, driver\'s license if applicable'),
            _buildBulletPoint(context, 'Location data: To provide ride services'),
            _buildBulletPoint(context, 'Payment information: Card details, transaction history'),
            _buildBulletPoint(context, 'Usage data: How you interact with our app'),
            const SizedBox(height: TSizes.spaceBtwSections),

            // How We Use Data
            Text(
              'How We Use Your Data',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: isDark ? TColors.white : TColors.black,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              'We use your data to provide and improve our services, including:',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            _buildBulletPoint(context, 'Connecting riders and drivers'),
            _buildBulletPoint(context, 'Processing payments'),
            _buildBulletPoint(context, 'Enhancing safety and security'),
            _buildBulletPoint(context, 'Providing customer support'),
            _buildBulletPoint(context, 'Sending ride updates and receipts'),
            _buildBulletPoint(context, 'Improving our services through analysis'),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Data Sharing
            Text(
              'Sharing Your Data',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: isDark ? TColors.white : TColors.black,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              'We may share your information with:',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            _buildBulletPoint(context, 'Riders and drivers as needed for rides'),
            _buildBulletPoint(context, 'Payment processors for transactions'),
            _buildBulletPoint(context, 'Service providers who help us operate our business'),
            _buildBulletPoint(context, 'Law enforcement when required by law'),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Your Rights
            Text(
              'Your Rights',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: isDark ? TColors.white : TColors.black,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              'You have the right to:',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            _buildBulletPoint(context, 'Access your personal data'),
            _buildBulletPoint(context, 'Request correction of inaccurate data'),
            _buildBulletPoint(context, 'Request deletion of your data'),
            _buildBulletPoint(context, 'Object to processing of your data'),
            _buildBulletPoint(context, 'Request restriction of processing'),
            _buildBulletPoint(context, 'Data portability'),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Contact Information
            Text(
              'Contact Us',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: isDark ? TColors.white : TColors.black,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              'If you have any questions about this privacy policy or our data practices, please contact us at:',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              'BGlory Rides\nEmail: privacy@bgloryrides.com\nPhone: +234 701 234 5678',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('• ', style: Theme.of(context).textTheme.bodyMedium),
          Expanded(child: Text(text, style: Theme.of(context).textTheme.bodyMedium)),
        ],
      ),
    );
  }
}