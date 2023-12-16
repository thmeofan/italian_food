import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/models/dish_model.dart';
import '../../consts/app_colors.dart';
import '../../consts/app_text_style/menu_style.dart';

class DishTileWidget extends StatefulWidget {
  final Dish dish;

  DishTileWidget({required this.dish});

  @override
  State<DishTileWidget> createState() => _DishTileState();
}

class _DishTileState extends State<DishTileWidget> {
  bool _customIcon = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: AppColors.darkGreyColor,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: ExpansionTile(
          collapsedBackgroundColor: AppColors.darkGreyColor,
          backgroundColor: AppColors.darkGreyColor,
          leading: Image.network(widget.dish.picURL, width: 50, height: 50),
          title: Text(widget.dish.name, style: MenuTextStyle.caloriesTitle),
          subtitle: Text('${widget.dish.calories} kcal. per 100 gr',
              style: MenuTextStyle.caloriesStyle),
          trailing: SvgPicture.asset(_customIcon
              ? 'assets/icons/arrow_circle_up.svg'
              : 'assets/icons/arrow_circle_down.svg'),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ingredienti:', style: MenuTextStyle.ingredients),
                  ...widget.dish.ingredients
                      .map((ingredient) => Text(
                            ingredient,
                            style: MenuTextStyle.ingredientsList,
                          ))
                      .toList(),
                ],
              ),
            ),
          ],
          onExpansionChanged: (bool expanded) {
            setState(() => _customIcon = expanded);
          },
        ),
      ),
    );
  }
}