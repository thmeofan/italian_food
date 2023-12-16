import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:italian_food/views/app/widgets/category_widget.dart';
import 'package:italian_food/views/consts/app_text_style/menu_style.dart';
import 'package:italian_food/views/menu/widgets/menu_item_widget.dart';

import '../../../data/models/dessert_model.dart';
import '../../../data/models/dish_model.dart';
import '../../../data/models/hot_meal_model.dart';
import '../../../data/models/pizza_model.dart';
import '../../../data/models/salad_model.dart';
import '../../../data/models/soup_model.dart';
import '../../consts/app_colors.dart';
import '../../consts/app_text_style/settings_style.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String selectedCategory = 'All Categories';

  List<Dish> getDishesForSelectedCategory() {
    switch (selectedCategory) {
      case 'Pizza':
        return pizza;
      case 'Salad':
        return salads;
      case 'Hot Meal':
        return hotMeals;
      case 'Soup':
        return soups;
      case 'Dessert':
        return desserts;
      case 'All Categories':
      default:
        return [
          ...pizza,
          ...salads,
          ...hotMeals,
          ...soups,
          ...desserts,
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Dish> displayedDishes = getDishesForSelectedCategory();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Benvenuti nel mondo della cucina italiana',
          style: SettingsTextStyle.screenTitle,
        ),
        centerTitle: true,
      ),
      extendBodyBehindAppBar: false,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(height: size.height * 0.01),
          SearchBar(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Categorie',
                style: MenuTextStyle.subtitle,
              ),
            ],
          ),
          Container(
            height: 25,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CategoryWidget(
                    onTap: () {
                      setState(() {
                        selectedCategory = 'All Categories';
                      });
                    },
                    icon: SvgPicture.asset('fake_icon.svg'),
                    title: 'Tutto'),
                SizedBox(
                  width: size.width * 0.01,
                ),
                CategoryWidget(
                    onTap: () {
                      setState(() {
                        selectedCategory = 'Pizza';
                      });
                    },
                    icon: SvgPicture.asset('assets/icons/pizza.svg'),
                    title: 'Pizza'),
                SizedBox(
                  width: size.width * 0.01,
                ),
                CategoryWidget(
                    onTap: () {
                      setState(() {
                        selectedCategory = 'Salad';
                      });
                    },
                    icon: SvgPicture.asset('assets/icons/insalate.svg'),
                    title: 'Insalate'),
                SizedBox(
                  width: size.width * 0.01,
                ),
                CategoryWidget(
                    onTap: () {
                      setState(() {
                        selectedCategory = 'Hot Meal';
                      });
                    },
                    icon: SvgPicture.asset('assets/icons/piatto_caldo.svg'),
                    title: 'Piatto Caldo'),
                SizedBox(
                  width: size.width * 0.01,
                ),
                CategoryWidget(
                    onTap: () {
                      setState(() {
                        selectedCategory = 'Soup';
                      });
                    },
                    icon: SvgPicture.asset('assets/icons/zuppe.svg'),
                    title: 'Zuppe'),
                SizedBox(
                  width: size.width * 0.01,
                ),
                CategoryWidget(
                    onTap: () {
                      setState(() {
                        selectedCategory = 'Dessert';
                      });
                    },
                    icon: SvgPicture.asset('assets/icons/dessert.svg'),
                    title: 'Dessert'),
              ],
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Piatti italiani',
                style: MenuTextStyle.subtitle,
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
              ),
              itemCount: displayedDishes.length,
              itemBuilder: (BuildContext context, int index) {
                return MenuItemWidget(dish: displayedDishes[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
