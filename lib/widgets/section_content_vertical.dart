import 'package:flutter/material.dart';

import '../global/constants.dart';

class SectionContentVertical extends StatelessWidget {
  final List<Map<String, dynamic>> itemsList;
  final Size size;
  const SectionContentVertical({
    super.key,
    required this.itemsList,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemsList.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          width: size.width * 0.6,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  itemsList[index]['image'],
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: AppSizes.mediumGap),
              SizedBox(
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemsList[index]['name'],
                      style: const TextStyle(
                        fontSize: AppSizes.mediumFont,
                        color: AppColors.primaryFont,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      itemsList[index]['location'],
                      style: const TextStyle(
                        fontSize: AppSizes.extraSmallFont,
                        color: AppColors.secondaryFont,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 3),
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
              ),
            ],
          ),
        );
      },
    );
  }
}
