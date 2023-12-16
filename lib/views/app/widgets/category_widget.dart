import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:italian_food/views/consts/app_colors.dart';
import 'package:italian_food/views/consts/app_text_style/menu_style.dart';

class CategoryWidget extends StatelessWidget {
  final VoidCallback onTap;
  final SvgPicture icon;
  final String title;
  const CategoryWidget({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.darkGreyColor,
          ),
          child: Row(
            children: [
              icon,
              SizedBox(
                width: size.width * 0.001,
              ),
              Text(
                title,
                style: MenuTextStyle.category,
              )
            ],
          ),
        ),
      ),

      //   child: Row(children: [SvgPicture.asset('assets/icons/pizza'), const Text('Pizza')],),),
      // Container(decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(8),
      // ),
      //   child: Row(children: [ const Text()],),),
      // Container(decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(8),
      // ),
      //   child: Row(children: [), const Text()],),),
      // Container(decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(8),
      // ),
      //   child: Row(children: [, const Text()],),),
    );
  }
}
