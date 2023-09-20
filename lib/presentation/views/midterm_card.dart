import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../data/Models/midterm_model.dart';
import '../styles/app_colors.dart';
import '../widgets/default_text.dart';

class MidtermCardItem extends StatelessWidget {
  MidtermCardItem({
    required this.mModel,
    Key? key,
  }) : super(key: key);
  MidtermModel mModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DefaultText(text: mModel.mTitle),
              Row(
                children: [
                  const Icon(
                    Icons.alarm,
                    color: AppColors.primaryColor,
                  ),
                  DefaultText(text: mModel.mTime)
                ],
              )
            ],
          ),
          SizedBox(height: 3.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const DefaultText(
                    text: 'Exam Date',
                    textColor: Colors.grey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.calendar_month_outlined,
                      ),
                      DefaultText(text: mModel.examDate)
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  const DefaultText(
                    text: 'Start Time',
                    textColor: Colors.grey,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_alarms_outlined,
                        color: Colors.green,
                      ),
                      DefaultText(text: mModel.startTime)
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  const DefaultText(
                    text: 'End Time',
                    textColor: Colors.grey,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.alarm,
                        color: Colors.red,
                      ),
                      DefaultText(text: mModel.endTime)
                    ],
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
