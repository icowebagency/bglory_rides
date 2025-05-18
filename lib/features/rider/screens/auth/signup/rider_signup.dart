import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';  // Add this import
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import '../../../../../common/widgets/buttons/button.dart';
import '../../../../../common/widgets/form/password_field.dart';
import '../../../../../common/widgets/form/text_form_field.dart';
import '../../../../../common/widgets/loaders/loading_overlay.dart';
import '../../../../../routing/rider_routing.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../../../utils/validators/validation.dart';

class RiderSignup extends StatefulWidget {
  const RiderSignup({super.key});

  @override
  State<RiderSignup> createState() => _RiderSignupState();
}

class _RiderSignupState extends State<RiderSignup> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _emailFormKey = GlobalKey<FormState>();
  final _phoneFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  PhoneNumber? _phoneNumber;
  bool _agreeToTerms = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      FocusScope.of(context).unfocus(); // Hide keyboard on tab change
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSignupWithEmail() {
    if (_emailFormKey.currentState!.validate()) {
      if (!_agreeToTerms) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please agree to the Terms of Service and Privacy Policy")),
        );
        return;
      }

      setState(() {
        _isLoading = true;
      });

      // Handle signup in UI for now
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
        });
        // Navigate to next screen or show success
        context.push(BGRiderRouteNames.riderUserDetails);
      });
    }
  }

  void _handleSignupWithPhone() {
    if (_phoneFormKey.currentState!.validate() && _phoneNumber != null) {
      if (!_agreeToTerms) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please agree to the Terms of Service and Privacy Policy")),
        );
        return;
      }

      setState(() {
        _isLoading = true;
      });

      // Handle signup in UI for now
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
        });
        // Navigate to verification screen
        context.push(BGRiderRouteNames.riderPhoneVerificationScreen);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Dismiss keyboard when tapping outside
      },
      child: Scaffold(
        body: TLoadingOverlay(
          isLoading: _isLoading,
          backgroundColor: isDark ? TColors.dark : TColors.light,
          opacity: 0.7,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top section with logo
                    Center(
                      child: Hero(
                        tag: 'logo',
                        child: Image(
                          height: 60,
                          image: AssetImage(
                            isDark ? TImages.darkAppLogo : TImages.lightAppLogo,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: TSizes.spaceBtwSections),

                    // Signup Text
                    Text(
                      TTexts.riderSignupTitle,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      TTexts.riderSignupSubTitle,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    // Tab bar for switching between email and phone signup
                    Container(
                      decoration: BoxDecoration(
                        color: isDark ? TColors.darkContainer : TColors.lightContainer,
                        borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
                      ),
                      child: TabBar(
                        controller: _tabController,
                        labelColor: isDark ? TColors.secondary : TColors.primary,
                        unselectedLabelColor: isDark ? TColors.lightGrey : TColors.darkGrey,
                        indicatorColor: isDark ? TColors.secondary : TColors.primary,
                        indicatorSize: TabBarIndicatorSize.tab,
                        dividerColor: Colors.transparent,
                        tabs: const [
                          Tab(
                            icon: Icon(Iconsax.sms),
                            text: 'Email',
                          ),
                          Tab(
                            icon: Icon(Iconsax.call),
                            text: 'Phone',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: TSizes.spaceBtwSections),

                    // Tab content
                    SizedBox(
                      height: 450, // Slightly taller than login to accommodate more fields
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          // Email Signup Form
                          _buildEmailSignupForm(isDark),

                          // Phone Signup Form
                          _buildPhoneSignupForm(isDark),
                        ],
                      ),
                    ),

                    const SizedBox(height: TSizes.spaceBtwItems),

                    // Already have an account button
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          context.push(BGRiderRouteNames.riderLogin);
                        },
                        child: RichText(
                          text: TextSpan(
                            text: TTexts.driverAlreadyHaveAnAccount,
                            style: Theme.of(context).textTheme.bodyMedium,
                            children: [
                              TextSpan(
                                text: TTexts.signIn,
                                style: TextStyle(
                                  color: isDark ? TColors.secondary : TColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailSignupForm(bool isDark) {
    return Form(
      key: _emailFormKey,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Email field
            TTextFormField(
              labelText: TTexts.email,
              hintText: TTexts.driverHintText,
              controller: _emailController,
              prefixIcon: const Icon(Iconsax.sms),
              keyboardType: TextInputType.emailAddress,
              validator: TValidator.validateEmail,
              textInputAction: TextInputAction.next,
              padding: const EdgeInsets.only(bottom: TSizes.spaceBtwInputFields),
              labelStyle: Theme.of(context).textTheme.labelLarge,
            ),

            // Password field
            TPasswordField(
              labelText: TTexts.password,
              hintText: TTexts.password,
              controller: _passwordController,
              validator: TValidator.validatePassword,
              textInputAction: TextInputAction.next,
              prefixIcon: const Icon(Iconsax.password_check),
            ),

            // Confirm Password field
            TPasswordField(
              labelText: "Confirm Password",
              hintText: "Re-enter your password",
              controller: _confirmPasswordController,
              validator: (value) {
                if (value != _passwordController.text) {
                  return "Passwords do not match";
                }
                return null;
              },
              textInputAction: TextInputAction.done,
              prefixIcon: const Icon(Iconsax.password_check),
            ),

            const SizedBox(height: TSizes.md),

            // Terms and conditions
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: _agreeToTerms,
                  onChanged: (value) {
                    setState(() {
                      _agreeToTerms = value ?? false;
                    });
                  },
                  activeColor: isDark ? TColors.secondary : TColors.primary,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: RichText(
                      text: TextSpan(
                        text: TTexts.iAgreeTo + ' ',
                        style: Theme.of(context).textTheme.bodySmall,
                        children: [
                          TextSpan(
                            text: TTexts.privacyPolicy,
                            style: TextStyle(
                              color: isDark ? TColors.secondary : TColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.push(BGRiderRouteNames.riderPrivacyPolicy);
                              },
                          ),
                          TextSpan(text: ' ${TTexts.and} '),
                          TextSpan(
                            text: TTexts.termsOfUse,
                            style: TextStyle(
                              color: isDark ? TColors.secondary : TColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.push(BGRiderRouteNames.riderTermsOfUse);
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: TSizes.spaceBtwSections),

            // Sign up button
            TButton(
              text: TTexts.createAccount,
              onPressed: _handleSignupWithEmail,
              style: TButtonStyle.primary,
              backgroundColor: isDark ? TColors.secondary : TColors.primary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneSignupForm(bool isDark) {
    return Form(
      key: _phoneFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Phone field using IntlPhoneField
          Padding(
            padding: const EdgeInsets.only(bottom: TSizes.spaceBtwInputFields),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TTexts.phoneNo,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(height: 6),
                IntlPhoneField(
                  initialCountryCode: 'NG',
                  decoration: InputDecoration(
                    hintText: TTexts.signupPhoneHintText,
                    filled: true,
                    fillColor: isDark ? TColors.darkContainer : TColors.lightContainer,
                    prefixIcon: const Icon(Iconsax.call),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
                      borderSide: BorderSide(color: isDark ? TColors.darkGrey : TColors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
                      borderSide: BorderSide(color: isDark ? TColors.secondary : TColors.primary),
                    ),
                  ),
                  onChanged: (phone) {
                    setState(() {
                      _phoneNumber = phone;
                    });
                  },
                  validator: (phone) {
                    return TValidator.validatePhoneNumber(phone);
                  },
                ),
              ],
            ),
          ),

          // Information note
          Container(
            padding: const EdgeInsets.all(TSizes.md),
            decoration: BoxDecoration(
              color: isDark ? Colors.blue.withOpacity(0.1) : Colors.blue.withOpacity(0.05),
              borderRadius: BorderRadius.circular(TSizes.cardRadiusXs),
              border: Border.all(
                  color: isDark ? Colors.blue.withOpacity(0.3) : Colors.blue.withOpacity(0.2)
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Iconsax.info_circle,
                  color: isDark ? TColors.secondary : Colors.blue,
                  size: 20,
                ),
                const SizedBox(width: TSizes.sm),
                Expanded(
                  child: Text(
                    "We'll send a verification code to your phone to confirm your identity",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: TSizes.md),

          // Terms and conditions
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                value: _agreeToTerms,
                onChanged: (value) {
                  setState(() {
                    _agreeToTerms = value ?? false;
                  });
                },
                activeColor: isDark ? TColors.secondary : TColors.primary,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: RichText(
                    text: TextSpan(
                      text: TTexts.iAgreeTo + ' ',
                      style: Theme.of(context).textTheme.bodySmall,
                      children: [
                        TextSpan(
                          text: TTexts.privacyPolicy,
                          style: TextStyle(
                            color: isDark ? TColors.secondary : TColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.push(BGRiderRouteNames.riderPrivacyPolicy);
                            },
                        ),
                        TextSpan(text: ' ${TTexts.and} '),
                        TextSpan(
                          text: TTexts.termsOfUse,
                          style: TextStyle(
                            color: isDark ? TColors.secondary : TColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.push(BGRiderRouteNames.riderTermsOfUse);
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: TSizes.spaceBtwSections),

          // Continue button
          TButton(
            text: TTexts.createAccount,
            onPressed: _handleSignupWithPhone,
            style: TButtonStyle.primary,
            backgroundColor: isDark ? TColors.secondary : TColors.primary,
          ),
        ],
      ),
    );
  }
}