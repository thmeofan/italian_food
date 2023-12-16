import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:italian_food/views/consts/app_colors.dart';
import 'package:italian_food/views/consts/app_text_style/menu_style.dart';
import 'package:italian_food/views/consts/app_text_style/settings_style.dart';

import '../../../blocs/search_cubit/search_cubit.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.9,
      height: kToolbarHeight,
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.darkGreyColor,
          hintText: 'Search',
          hintStyle: SettingsTextStyle.searchbar,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none, // No border
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Colors.orange[800]!,
              width: 2.0,
            ),
          ),
          suffixIcon: Icon(
            Icons.search,
            color: AppColors.darkOrangeColor,
          ),
        ),
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        onChanged: (value) => context.read<SearchCubit>().updateSearch(value),
      ),
    );
    // TextField(
    //   keyboardType: TextInputType.text,
    // decoration: InputDecoration(
    //   hoverColor: AppColors.darkGreyColor,
    //   focusColor: AppColors.darkGreyColor,
    //   hintText: "Trova un piatto",
    //   hintStyle: SettingsTextStyle.searchbar,
    //   filled: true,
    //   fillColor: AppColors.darkGreyColor,
    //   enabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(8.0),
    //     borderSide: BorderSide(
    //       color: Theme.of(context).dividerColor,
    //     ),
    //   ),
    //   focusedBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(8.0),
    //   ),
    //   suffixIcon: Padding(
    //     padding: const EdgeInsets.all(10.0),
    //     child: SvgPicture.asset(
    //       'assets/icons/search.svg',
    //       width: 14.0,
    //       height: 14.0,
    //       color: AppColors.darkOrangeColor,
    //     ),
    //   ),
    // ),

    // );
  }
}
