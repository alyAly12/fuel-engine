import 'package:flutter/material.dart';
import 'package:sayarah/core/utils/app_colors.dart';
import 'package:sayarah/core/utils/assets_manager.dart';

class CompletedItemModel {
  final Color color;
  final String image;

  CompletedItemModel(this.color, this.image);
}

class CompletedItemList {
  static List<CompletedItemModel> completedOrderList = [
    CompletedItemModel(AppColors.pieChartColor, AssetsManager.carRepair),
    CompletedItemModel(AppColors.activeColor, AssetsManager.battery),
    CompletedItemModel(AppColors.greyColor, AssetsManager.tires),
    CompletedItemModel(AppColors.redColor, AssetsManager.coolant),
    CompletedItemModel(AppColors.lightTitleColor, AssetsManager.carWash),
    CompletedItemModel(AppColors.homeBox, AssetsManager.carOil),
    CompletedItemModel(AppColors.appBarColor, AssetsManager.gasPump),
    CompletedItemModel(AppColors.lightTitleColor, AssetsManager.carWash),
    CompletedItemModel(AppColors.pieChartColor, AssetsManager.carRepair),
    CompletedItemModel(AppColors.redColor, AssetsManager.coolant),
    CompletedItemModel(AppColors.lightTitleColor, AssetsManager.carWash),
    CompletedItemModel(AppColors.homeBox, AssetsManager.carOil),
  ];
}
