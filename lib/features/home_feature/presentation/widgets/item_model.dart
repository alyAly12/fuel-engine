import 'package:flutter/material.dart';
import 'package:sayarah/core/utils/app_colors.dart';
import 'package:sayarah/core/utils/assets_manager.dart';

class ItemModel {
  final Color color;
  final String image;

  ItemModel(this.color, this.image);
}

class ItemList {
  static List<ItemModel> activeOrdersList = [
    ItemModel(AppColors.pieChartColor, AssetsManager.carRepair),
    ItemModel(AppColors.activeColor, AssetsManager.battery),
    ItemModel(AppColors.greyColor, AssetsManager.tires),
    ItemModel(AppColors.redColor, AssetsManager.coolant),
    ItemModel(AppColors.lightTitleColor, AssetsManager.carWash),
    ItemModel(AppColors.homeBox, AssetsManager.carOil),
    ItemModel(AppColors.appBarColor, AssetsManager.gasPump),
    ItemModel(AppColors.activeColor, AssetsManager.battery),
    ItemModel(AppColors.greyColor, AssetsManager.tires),
    ItemModel(AppColors.redColor, AssetsManager.coolant),
    ItemModel(AppColors.lightTitleColor, AssetsManager.carWash),
    ItemModel(AppColors.activeColor, AssetsManager.battery),
    ItemModel(AppColors.greyColor, AssetsManager.tires),
    ItemModel(AppColors.redColor, AssetsManager.coolant),
    ItemModel(AppColors.lightTitleColor, AssetsManager.carWash),
  ];
}
