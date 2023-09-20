import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../data/Models/finals_model.dart';
import '../../views/finals_card.dart';
import '../../widgets/default_appbar.dart';

class FinalScreen extends StatelessWidget {
  FinalScreen({Key? key}) : super(key: key);

  List fModelDummyData = <FinalsModel>[
    FinalsModel(
        fTitle: 'Flutter',
        fTime: '3HRs',
        examDate: '19-08-2022',
        startTime: '12:00 PM',
        endTime: '2:00 PM'),
    FinalsModel(
        fTitle: 'React',
        fTime: '3HRs',
        examDate: '8-08-2022',
        startTime: '1:00 PM',
        endTime: '2:00 PM'),
    FinalsModel(
        fTitle: 'Ionic',
        fTime: '4HRs',
        examDate: '18-08-2022',
        startTime: '12:00 PM',
        endTime: '2:00 PM'),
    FinalsModel(
        fTitle: 'Xamarin',
        fTime: '4HRs',
        examDate: '18-08-2022',
        startTime: '12:00 PM',
        endTime: '2:00 PM'),
    FinalsModel(
        fTitle: 'Android',
        fTime: '4HRs',
        examDate: '18-08-2022',
        startTime: '12:00 PM',
        endTime: '2:00 PM'),
  ];

  /// TODO: Get data form API.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: const DefaultAppbar(
            automaticallyImplyLeading: true,
            title: 'Finals',
          )),
      body: ListView.builder(
        itemBuilder: (context, index) => Card(
          elevation: 5,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.sp),
              borderSide: const BorderSide(
                color: Colors.teal,
              )),
          margin: EdgeInsets.symmetric(
            vertical: 1.h,
          ),
          child: FinalsCardItem(
            fModel: fModelDummyData[index],
          ),
        ),
        itemCount: fModelDummyData.length,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
      ),
    );
  }
}
