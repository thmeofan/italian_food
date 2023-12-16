import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:italian_food/views/consts/app_colors.dart';
import 'package:italian_food/views/consts/app_text_style/menu_style.dart';

import '../../../data/models/dish_model.dart';
import '../../../data/models/soup_model.dart';
import '../../../util/app_routes.dart';

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget({
    super.key,
    required this.dish,
  });
  final Dish dish;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(screenSize.width * 0.02),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () =>
              Navigator.of(context).pushNamed(AppRoutes.dish, arguments: dish),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              color: AppColors.darkGreyColor,
              //   width: screenSize.width * 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(height: screenSize.width * 0.03),
                  FancyShimmerImage(
                    imageUrl: dish.picURL,
                    boxFit: BoxFit.cover,
                    width: double.infinity,
                    height: screenSize.height * 0.16,
                  ),
                  SizedBox(height: screenSize.height * 0.001),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: screenSize.height * 0.001),
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                dish.name,
                                softWrap: true,
                                style: MenuTextStyle.itemTitle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
