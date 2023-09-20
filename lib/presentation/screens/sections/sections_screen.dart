import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../data/Models/section_model.dart';
import '../../views/section_card.dart';
import '../../widgets/default_appbar.dart';

class SectionsScreen extends StatelessWidget {
  SectionsScreen({Key? key}) : super(key: key);

  List sModelDummyData = <SectionModel>[
    SectionModel(
        sTitle: 'Flutter',
        sTime: '3HRs',
        examDate: '19-08-2022',
        startTime: '12:00 PM',
        endTime: '2:00 PM'),
    SectionModel(
        sTitle: 'React',
        sTime: '3HRs',
        examDate: '8-08-2022',
        startTime: '1:00 PM',
        endTime: '2:00 PM'),
    SectionModel(
        sTitle: 'Ionic',
        sTime: '4HRs',
        examDate: '18-08-2022',
        startTime: '12:00 PM',
        endTime: '2:00 PM'),
    SectionModel(
        sTitle: 'Xamarin',
        sTime: '4HRs',
        examDate: '18-08-2022',
        startTime: '12:00 PM',
        endTime: '2:00 PM'),
    SectionModel(
        sTitle: 'Android',
        sTime: '4HRs',
        examDate: '18-08-2022',
        startTime: '12:00 PM',
        endTime: '2:00 PM'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: const DefaultAppbar(
            automaticallyImplyLeading: true,
            title: 'Sections',
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
          child: SectionCardItem(
            sModel: sModelDummyData[index],
          ),
        ),
        itemCount: sModelDummyData.length,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
      ),
    );
  }
}
