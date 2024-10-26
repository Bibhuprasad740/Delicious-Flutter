import 'package:flutter/material.dart';

import '../../global/constants.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/input_field.dart';
import '../../widgets/section_content.dart';
import '../../widgets/section_content_vertical.dart';
import '../../widgets/section_header.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final searchController = TextEditingController();
  final List<Map<String, dynamic>> categoriesList = [
    {
      'image': 'assets/images/cat_offer.png',
      'name': 'Offfers',
    },
    {
      'image': 'assets/images/cat_sri.png',
      'name': 'Sri Lankan',
    },
    {
      'image': 'assets/images/cat_3.png',
      'name': 'Itelian',
    },
    {
      'image': 'assets/images/cat_4.png',
      'name': 'Indian',
    },
  ];

  final List<Map<String, dynamic>> restaurantList = [
    {
      'name': 'Delicious',
      'image': 'assets/images/res_1.png',
      'rating': '4.9',
      'type': 'Restaurant',
      'location': 'Tangi, 754022',
      'food_type': 'Mixed',
    },
  ];

  final List<Map<String, dynamic>> mostPopularList = [
    {
      'name': 'Pizza',
      'image': 'assets/images/m_res_1.png',
      'price': 100,
      'rating': '4.9',
      'rating_count': 124,
      'location': 'Tangi, 754022',
      'id': '1jjc43hytnldnh34Blj',
      'type': 'vegetarian',
    },
    {
      'name': 'Cheesy Bread Omlette',
      'image': 'assets/images/m_res_2.png',
      'price': 249,
      'rating': '4.7',
      'rating_count': 90,
      'location': 'Tangi, 754022',
      'id': '1jjc43hytnldnh34Blj',
      'type': 'Non-Veg',
    },
  ];

  final List<Map<String, dynamic>> recentList = [
    {
      'name': 'Pizza',
      'price': 249,
      'image': 'assets/images/item_1.png',
      'rating': '4.9',
      'rating_count': 124,
      'type': 'Restaurant',
      'location': 'Tangi, 754022',
      'id': '1jjc43hytnldnh34Blj',
      'food_type': 'Mixed',
    },
    {
      'name': 'Chicken',
      'price': 249,
      'image': 'assets/images/item_2.png',
      'rating': '4.9',
      'rating_count': 124,
      'type': 'Restaurant',
      'location': 'Tangi, 754022',
      'id': '1jjc43hytnldnh34Blj',
      'food_type': 'Mixed',
    },
    {
      'name': 'Delicious',
      'price': 249,
      'image': 'assets/images/item_3.png',
      'rating': '4.9',
      'rating_count': 124,
      'type': 'Restaurant',
      'location': 'Tangi, 754022',
      'id': '1jjc43hytnldnh34Blj',
      'food_type': 'Mixed',
    },
  ];

  @override
  Widget build(BuildContext context) {
    var size = Utils.getSize(context);
    return Scaffold(
      appBar: CustomAppBar(size: size),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.mediumPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Delivery to',
                    style: TextStyle(
                      color: AppColors.primaryFont,
                      fontSize: AppSizes.smallFont,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.5,
                    child: Row(
                      children: [
                        const Flexible(
                          child: Text(
                            'Laxmi Bazar, 754022',
                            style: TextStyle(
                              fontSize: AppSizes.mediumFont,
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        const SizedBox(width: AppSizes.mediumPadding),
                        Image.asset(
                          'assets/images/dropdown.png',
                          height: 15,
                          width: 15,
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: AppSizes.mediumGap),
              InputField(
                controller: searchController,
                labelText: 'Search Food',
                onChanged: () {},
                prefixIcon: Icons.search,
              ),
              const SizedBox(height: AppSizes.mediumGap),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoriesList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              categoriesList[index]['image'],
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Flexible(
                            child: Text(
                              categoriesList[index]['name'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: AppSizes.extraSmallFont,
                                color: AppColors.primaryFont,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: AppSizes.mediumGap),
              SectionHeader(
                title: 'Most Popular',
                buttonText: 'Show',
                onButtonPressed: () {},
              ),
              SectionContent(itemsList: mostPopularList, size: size),
              SectionHeader(
                title: 'Recent Items',
                buttonText: 'Show',
                onButtonPressed: () {},
              ),
              SectionContentVertical(itemsList: recentList, size: size)
            ],
          ),
        ),
      ),
    );
  }
}
