import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:italian_food/data/models/dish_model.dart';

import '../../consts/app_colors.dart';

class DishScreen extends StatelessWidget {
  final Dish dish;
  const DishScreen({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'News',
          softWrap: true,
        ),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset(
            'assets/icons/back.svg',
            width: 24.0,
            height: 24.0,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: screenSize.height * 0.1,
          ),
          Container(
            height: screenSize.height *
                0.4, // Set the image height to 40% of the screen height
            width: screenSize.width * 0.9,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: FancyShimmerImage(
                boxFit: BoxFit.cover,
                imageUrl: dish.picURL,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * 0.04,
                vertical: screenSize.width * 0.01),
            child: Text(
              dish.name,
            ),
          ),
          Expanded(
            // This will make the remaining space scrollable
            child: SingleChildScrollView(
              padding: EdgeInsets.all(screenSize.width * 0.04),
              child: Text(
                dish.history,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
