import 'package:flutter/material.dart';
import '../../../../../../core/component/custom_toggle_button.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_strings.dart';

class ReportIssueList extends StatefulWidget {
  const ReportIssueList({super.key});

  @override
  State<ReportIssueList> createState() => _ReportIssueListState();
}

class _ReportIssueListState extends State<ReportIssueList> {
  bool _scanIssue = false;
  bool _nfcDamage = false;
  bool _identifyDriver = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomToggleButton(
                productType: AppStrings.scanningIssue,
                textSize: 13,
                textWeight: FontWeight.normal,
                buttonColor: _scanIssue ? AppColors.orderNumberColor : Colors.white,
                titleColor: _scanIssue ? Colors.white : AppColors.darkGrey,
                border: _scanIssue
                    ? Border.all(color: Colors.transparent, width: 0.7)
                    : Border.all(color: AppColors.orderNumberColor, width: 0.7),
                onTap: () {
                  setState(() {
                    _scanIssue = !_scanIssue;
                  });
                },
                radius: BorderRadius.circular(12),
              ),
              SizedBox(
                width: 15,
              ),
              CustomToggleButton(
                textSize: 13,
                textWeight: FontWeight.normal,
                productType: AppStrings.nfcDamaged,
                buttonColor: _nfcDamage ? AppColors.orderNumberColor : Colors.white,
                titleColor: _nfcDamage ? Colors.white : AppColors.darkGrey,
                border: _nfcDamage
                    ? Border.all(color: Colors.transparent, width: 0.7)
                    : Border.all(color: AppColors.orderNumberColor, width: 0.7),
                onTap: () {
                  setState(() {
                    _nfcDamage = !_nfcDamage;
                  });
                },
                radius: BorderRadius.circular(12),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2),
          child: CustomToggleButton(
            textSize: 13,
            textWeight: FontWeight.normal,
            productType: AppStrings.identifyDriver,
            buttonColor: _identifyDriver ? AppColors.orderNumberColor : Colors.white,
            titleColor: _identifyDriver ? Colors.white : AppColors.darkGrey,
            border: _identifyDriver
                ? Border.all(color: Colors.transparent, width: 0.7)
                : Border.all(color: AppColors.orderNumberColor, width: 0.7),
            onTap: () {
              setState(() {
                _identifyDriver = !_identifyDriver;
              });
            },
            radius: BorderRadius.circular(12),
          ),
        )
      ],
    );
  }
}
