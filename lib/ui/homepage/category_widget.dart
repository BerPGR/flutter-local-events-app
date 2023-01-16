// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:events/app_state.dart';
import 'package:events/styleguide.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/category.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;

  const CategoryWidget({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final isSelected = appState.selectedCategoryId == category.categoryId;

    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          appState.updateCategoryId(category.categoryId);
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        width: 90,
        height: 90,
        decoration: BoxDecoration(
            border: Border.all(
                color: isSelected ? Colors.white : Color(0x99FFFFFF), width: 3),
            borderRadius: BorderRadius.circular(15),
            color: isSelected ? Colors.white : Colors.transparent),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              category.icon,
              color: isSelected ? Theme.of(context).primaryColor : Colors.white,
              size: 40,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              category.name,
              style: isSelected ? selectedCategoryTextStyle : categoryTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
