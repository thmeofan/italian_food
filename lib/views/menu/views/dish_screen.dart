import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:italian_food/data/models/dish_model.dart';
import 'package:italian_food/views/consts/app_text_style/menu_style.dart';

import '../../consts/app_colors.dart';

class DishScreen extends StatelessWidget {
  final Dish dish;

  const DishScreen({super.key, required this.dish});

//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       backgroundColor: AppColors.backgroundColor,
//       appBar: AppBar(
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         leading: Padding(
//           padding: EdgeInsets.only(left: screenSize.width * 0.05),
//           child: Container(
//             width: screenSize.width * 0.2,
//             height: screenSize.width * 0.2,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: AppColors.lightGreyColor.withOpacity(0.3),
//             ),
//             child: IconButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               icon: SvgPicture.asset(
//                 'assets/icons/arrow-left1.svg',
//                 width: 24.0,
//                 height: 24.0,
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: NetworkImage(
//               dish.picURL,
//             ),
//             fit: BoxFit.fill,
//             colorFilter: ColorFilter.mode(
//               Colors.transparent.withOpacity(1),
//               BlendMode.dstATop,
//             ),
//           ),
//         ),
//         child: Padding(
//           padding: EdgeInsets.only(top: screenSize.height * 0.55),
//           child: Container(
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(15),
//                 topRight: Radius.circular(15),
//               ),
//               color: AppColors.whiteColor,
//             ),
//             child: Column(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: screenSize.width * 0.06,
//                       vertical: screenSize.width * 0.04),
//                   child: Text(
//                     dish.name,
//                     style: MenuTextStyle.dishScreenTitle,
//                   ),
//                 ),
//                 SingleChildScrollView(
//                   padding: EdgeInsets.all(screenSize.width * 0.02),
//                   child: Text(
//                     dish.history,
//                     style: MenuTextStyle.dishScreenText,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final imageHeight = screenSize.height * 0.4; // 40% for the image
    final imageOverlap =
        25.0; // The amount by which the container will overlap the image

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(left: screenSize.width * 0.05),
          child: Container(
            width: screenSize.width * 0.2,
            height: screenSize.width * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.lightGreyColor.withOpacity(0.3),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: SvgPicture.asset(
                'assets/icons/arrow-left1.svg',
                width: 24.0,
                height: 24.0,
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: imageHeight,
                width: double.infinity,
                child: Image.network(
                  dish.picURL,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
          Positioned(
            top: imageHeight - imageOverlap,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width * 0.06,
                          vertical: screenSize.width * 0.04),
                      child: Text(
                        dish.name,
                        style: MenuTextStyle.dishScreenTitle,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width * 0.06),
                      child: Text(
                        dish.history,
                        style: MenuTextStyle.dishScreenText,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
