import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../../../data/models/soup_model.dart';
import '../../../util/app_routes.dart';

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget({
    super.key,
  });

  //final FoodType type;
  // final int amount;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(screenSize.width * 0.005),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).cardColor,
        child: InkWell(
          // onTap: () => Navigator.of(context)
          //     .pushNamed(AppRoutes.chosenCategory, arguments: type),
          radius: 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenSize.width * 0.03),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: FancyShimmerImage(
                  imageUrl: soups.first.picURL,
                  boxFit: BoxFit.cover,
                  width: screenSize.width * 0.4,
                  height: screenSize.height * 0.15,
                ),
              ),
              SizedBox(height: screenSize.height * 0.01),
              Padding(
                  padding: EdgeInsets.all(screenSize.width * 0.001),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: screenSize.height * 0.01),
                        child: Row(
                          children: [
                            Text(
                              soups.first.name,
                              //  style: AppTextStyles.itemCardTitleStyle,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding:
                      //       EdgeInsets.only(left: screenSize.height * 0.01),
                      //   child: Row(
                      //     children: [
                      //       Text(
                      //         '($amount)',
                      //         //  style: AppTextStyles.itemCardAmountStyle,
                      //         textAlign: TextAlign.start,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
