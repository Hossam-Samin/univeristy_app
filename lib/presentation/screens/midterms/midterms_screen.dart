import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../data/Models/midterm_model.dart';
import '../../views/midterm_card.dart';
import '../../widgets/default_appbar.dart';

class MidtermScreen extends StatefulWidget {
  const MidtermScreen({Key? key}) : super(key: key);

  @override
  State<MidtermScreen> createState() => _MidtermScreenState();
}

class _MidtermScreenState extends State<MidtermScreen> {
  List mModelDummyData = <MidtermModel>[
    MidtermModel(
        mTitle: 'Flutter',
        mTime: '3HRs',
        examDate: '19-08-2022',
        startTime: '12:00 PM',
        endTime: '2:00 PM'),
    MidtermModel(
        mTitle: 'React',
        mTime: '3HRs',
        examDate: '8-08-2022',
        startTime: '1:00 PM',
        endTime: '2:00 PM'),
    MidtermModel(
        mTitle: 'Ionic',
        mTime: '4HRs',
        examDate: '18-08-2022',
        startTime: '12:00 PM',
        endTime: '2:00 PM'),
    MidtermModel(
        mTitle: 'Xamarin',
        mTime: '4HRs',
        examDate: '18-08-2022',
        startTime: '12:00 PM',
        endTime: '2:00 PM'),
    MidtermModel(
        mTitle: 'Android',
        mTime: '4HRs',
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
            title: 'Midterm',
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
          child: MidtermCardItem(
            mModel: mModelDummyData[index],
          ),
        ),
        itemCount: mModelDummyData.length,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
      ),
    );
  }
}
