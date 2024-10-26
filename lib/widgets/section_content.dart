import 'package:flutter/material.dart';

import '../global/constants.dart';

class SectionContent extends StatelessWidget {
  final List<Map<String, dynamic>> itemsList;
  final Size size;

  const SectionContent({
    super.key,
    required this.itemsList,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemsList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            width: size.width * 0.6, // Image takes 70% of screen width
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    itemsList[index]['image'],
                    height: size.height * 0.2,
                    width: size.width * 0.7,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        itemsList[index]['name'],
                        style: const TextStyle(
                          fontSize: AppSizes.mediumFont,
                          color: AppColors.primaryFont,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: AppColors.primary,
                          size: 14,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          itemsList[index]['rating'],
                          style: const TextStyle(
                            fontSize: AppSizes.extraSmallFont,
                            color: AppColors.primaryFont,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 3),
                        Text(
                          '(${itemsList[index]['rating_count']} ratings)',
                          style: const TextStyle(
                            fontSize: AppSizes.extraSmallFont,
                            color: AppColors.primaryFont,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  itemsList[index]['location'],
                  style: const TextStyle(
                    fontSize: AppSizes.extraSmallFont,
                    color: AppColors.secondaryFont,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
