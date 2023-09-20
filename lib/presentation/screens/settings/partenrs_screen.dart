import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OurPartners extends StatelessWidget {
  const OurPartners({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Our Partners",
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 1.0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.deepOrange,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  height: 22.h,
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.bottomLeft,
                          colors: [Colors.grey, Colors.white30, Colors.grey])),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 5, left: 5, right: 290),
                        child: Text(
                          "ODC",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Center(
                          child: RichText(
                        textHeightBehavior: const TextHeightBehavior(
                          applyHeightToFirstAscent: true,
                          applyHeightToLastDescent: true,
                        ),
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                            text: "Orange ",
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "Digital Center",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 25)),
                            ]),
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
