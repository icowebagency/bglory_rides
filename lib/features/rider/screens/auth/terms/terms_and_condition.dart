import 'package:flutter/material.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:bglory_rides/utils/helpers/helper_functions.dart';

class TermsOfUseScreen extends StatelessWidget {
  const TermsOfUseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms of Use'),
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
              'Welcome to BGlory Rides. These Terms of Use govern your use of our application and services. By using our app, you agree to these terms in full. If you disagree with any part of these terms, you must not use our app or services.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Account Terms
            Text(
              'Account Terms',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: isDark ? TColors.white : TColors.black,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              'When you create an account with us, you guarantee that:',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            _buildBulletPoint(context, 'The information you provide is accurate and complete'),
            _buildBulletPoint(context, 'You are at least 18 years old'),
            _buildBulletPoint(context, 'You will keep your account information updated'),
            _buildBulletPoint(context, 'You are responsible for maintaining the security of your account'),
            _buildBulletPoint(context, 'You will not share your account with others'),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Using Our Service
            Text(
              'Using Our Service',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: isDark ? TColors.white : TColors.black,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              'You agree not to use our service to:',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            _buildBulletPoint(context, 'Violate any laws or regulations'),
            _buildBulletPoint(context, 'Harass, abuse, or harm another person'),
            _buildBulletPoint(context, 'Send spam or other unwanted messages'),
            _buildBulletPoint(context, 'Impersonate others or provide inaccurate information'),
            _buildBulletPoint(context, 'Interfere with the operation of our service'),
            _buildBulletPoint(context, 'Engage in any activity that could damage or impair our service'),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Payments & Fees
            Text(
              'Payments & Fees',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: isDark ? TColors.white : TColors.black,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              'By using our services, you agree to pay all fees associated with the services you use. We reserve the right to modify our fees at any time. All payments are final and non-refundable except as required by law or at our discretion.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Intellectual Property
            Text(
              'Intellectual Property',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: isDark ? TColors.white : TColors.black,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              'The app and all content, features, and functionality are owned by BGlory Rides and are protected by copyright, trademark, and other intellectual property laws. You may not copy, modify, distribute, sell, or lease any part of our services without our explicit permission.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Limitation of Liability
            Text(
              'Limitation of Liability',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: isDark ? TColors.white : TColors.black,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              'To the maximum extent permitted by law, BGlory Rides shall not be liable for any indirect, incidental, special, consequential, or punitive damages, including loss of profits, data, or goodwill, resulting from your access to or use of our services.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Changes to Terms
            Text(
              'Changes to Terms',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: isDark ? TColors.white : TColors.black,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              'We reserve the right to modify these terms at any time. We will notify users of any significant changes. Your continued use of our services after such modifications constitutes your acceptance of the updated terms.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Governing Law
            Text(
              'Governing Law',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: isDark ? TColors.white : TColors.black,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              'These terms shall be governed by and construed in accordance with the laws of Nigeria, without regard to its conflict of law principles.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
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
              'If you have any questions about these Terms of Use, please contact us at:',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              'BGlory Rides\nEmail: legal@bgloryrides.com\nPhone: +234 701 234 5678',
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