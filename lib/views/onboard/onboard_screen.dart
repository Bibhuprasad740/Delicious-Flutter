import 'package:flutter/material.dart';

import '../../global/constants.dart';
import '../../widgets/submit_button.dart';
import '../tab/tab_screen.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  List pages = [
    {
      'title': 'Find Food You Love',
      'subtitle':
          'Discover the best foods from 100+ food items and fast delivery to your doorsteps.',
      'image': 'assets/images/splash_1.png',
    },
    {
      'title': 'Fast Delivery',
      'subtitle': 'Fast delivery to your home or office\nwherever you are!',
      'image': 'assets/images/splash_2.png',
    },
    {
      'title': 'Live Tracking',
      'subtitle': 'Realtime tracking of your ordered food in app.',
      'image': 'assets/images/splash_3.png',
    },
  ];

  final _pageController = PageController();
  var currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page?.floor() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: pages.length,
            itemBuilder: (context, index) {
              var page = pages[index] as Map? ?? {};
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.largePadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Dynamically sized image based on screen height
                    Flexible(
                      flex: 4, // Take 40% of the available height
                      child: Container(
                        constraints: BoxConstraints(
                          maxHeight: size.height *
                              0.4, // Max height of 40% of screen height
                        ),
                        child: Image.asset(
                          page['image'].toString(),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSizes.smallGap),

                    // Title
                    Text(
                      page['title'].toString(),
                      style: const TextStyle(
                        color: AppColors.primaryFont,
                        fontSize: AppSizes.extralargeFont,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: AppSizes.smallGap),

                    // Subtitle
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width *
                              0.05), // Dynamic padding for responsiveness
                      child: Text(
                        page['subtitle'].toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.primaryFont,
                          fontSize: AppSizes.smallFont,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSizes.largeGap),
                  ],
                ),
              );
            },
          ),
          Column(
            children: [
              const Spacer(),

              // Pagination dots
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: pages.asMap().entries.map((entry) {
                  var index = entry.key;
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 4.0), // Space between dots
                    width: index == currentPage
                        ? 12.0
                        : 8.0, // Active dot is larger
                    height: index == currentPage ? 12.0 : 8.0,
                    decoration: BoxDecoration(
                      color: index == currentPage
                          ? AppColors.primary
                          : AppColors.placeholder,
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 20.0), // Add space after dots

              // Button for Next/Get Started
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.largePadding),
                child: SubmitButton(
                    text: currentPage == pages.length - 1
                        ? 'Get Started'
                        : 'Next',
                    onPressed: () {
                      if (currentPage >= 2) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const TabScreen(),
                        ));
                      } else {
                        currentPage += 1;
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    }),
              ),

              const SizedBox(height: AppSizes.largeGap),
            ],
          ),
        ],
      ),
    );
  }
}
