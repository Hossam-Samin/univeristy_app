import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FQS extends StatelessWidget {
  const FQS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "FQS",
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              Card(
                child: ExpansionTile(
                  iconColor: Colors.black,
                  title: const Text(
                    "Q1: How many countries Orange Digital Center is in?",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    const Text(
                      "16 Country",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
