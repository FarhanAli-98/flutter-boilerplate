import 'package:template/core/constants/app_enums.dart';
import 'package:template/core/extention/build_extention.dart';
import 'package:template/core/resources/routes/app_navigation.dart';
import 'package:template/core/resources/routes/app_routes.dart';
import 'package:template/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WalkthroughScreen extends StatefulWidget {
  const WalkthroughScreen({super.key});

  @override
  State<WalkthroughScreen> createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<_WalkthroughPageData> _pages = const [
    _WalkthroughPageData(
      title: 'Rediscover paths forgotten, journeys inward awaiting, nature’s whispers guiding you home to yourself again.',
      buttonText: 'Begin the journey',
      backgroundImage: 'assets/images/walk1.png',
    ),
    _WalkthroughPageData(
      title: 'Pause. Reflect. Become. In every heartbeat, a call to explore who you truly are',
      buttonText: 'Next',
      backgroundImage: 'assets/images/walk2.png',
    ),
    _WalkthroughPageData(
      title: 'Leave behind the noise; step quietly into authenticity, reconnecting with the rhythm of your soul.',
      buttonText: 'Next',
      backgroundImage: 'assets/images/walk3.png',
    ),
    _WalkthroughPageData(
      title: 'Step inside template—your journey begins now, deep within nature, deeper within yourself.',
      buttonText: 'Enter Your Sanctuary',
      backgroundImage: 'assets/images/walk3.png',
    ),
  ];

  void _onNextPressed() {
    if (_currentIndex < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      AppNavigation.pushReplacementTo(AppRoutes.welcomeRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (index) => setState(() => _currentIndex = index),
            itemBuilder: (context, index) {
              final page = _pages[index];
              return Stack(
                fit: StackFit.expand,
                children: [
                  // Background image
                  Image.asset(
                    page.backgroundImage,
                    fit: BoxFit.fill,
                  ),

                  // Overlay content
                  Container(
                    color: Colors.black.withOpacity(0.5),
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        const Spacer(flex: 2), // top spacing

                        Flexible(
                          flex: 3,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              page.title,
                              textAlign: TextAlign.start,
                              style: context.textTheme.headlineSmall?.copyWith(
                                color: context.colorTheme.textColor,
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),

                        const Spacer(flex: 2), // middle spacing

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          child: CustomButton(
                            title: page.buttonText,
                            buttonType: ButtonType.primary,
                            color: (_pages.length - 1) == index ? context.colorTheme.primaryColor : context.colorTheme.backgroundColor,
                            fontColor: (_pages.length - 1) != index ? context.colorTheme.primaryColor : context.colorTheme.textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            shapeBorder: RoundedRectangleBorder(
                              side: BorderSide(
                                color: context.colorTheme.primaryColor,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            minSize: Size(context.width, 54),
                            onPressed: _onNextPressed,
                          ),
                        ),

                        const Spacer(), // bottom spacing
                      ],
                    ),
                  ),
                ],
              );
            },
          ),

          // Bottom dot indicator
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: AnimatedSmoothIndicator(
                activeIndex: _currentIndex,
                count: _pages.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  spacing: 6,
                  expansionFactor: 3,
                  activeDotColor: context.colorTheme.primaryColor,
                  dotColor: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WalkthroughPageData {
  final String title;
  final String buttonText;
  final String backgroundImage;

  const _WalkthroughPageData({
    required this.title,
    required this.buttonText,
    required this.backgroundImage,
  });
}
