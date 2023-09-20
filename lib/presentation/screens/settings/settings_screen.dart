import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:university/presentation/screens/settings/partenrs_screen.dart';
import 'package:university/presentation/screens/settings/question_scrren.dart';
import 'package:university/presentation/screens/settings/support_screen.dart';
import 'package:university/presentation/screens/settings/terms_screen.dart';
import '../../styles/app_colors.dart';
import '../login/login_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Setting",
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 1.0,
        backgroundColor: Colors.white,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Card(
                  child: ListTile(
                    onTap: () {},
                    trailing: const Text(
                      "FQS",
                      style: TextStyle(),
                    ),
                    leading: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const FQS(),
                        ));
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                      ),
                    ),
                    minLeadingWidth: 80.w,
                    contentPadding: const EdgeInsets.only(
                      top: 5,
                      left: 5,
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    onTap: () {},
                    trailing: const Text(
                      "Terms & Conditions",
                    ),
                    leading: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TermsAndCondition(
                            text: "I am flutter developer in company",
                          ),
                        ));
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                      ),
                    ),
                    minLeadingWidth: 73.w,
                    contentPadding: const EdgeInsets.only(
                      top: 5,
                      left: 5,
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    onTap: () {},
                    trailing: const Text(
                      "Our Partenrs",
                      style: TextStyle(),
                    ),
                    leading: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const OurPartners(),
                        ));
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                      ),
                    ),
                    contentPadding: const EdgeInsets.only(left: 5, top: 5),
                    minLeadingWidth: 77.w,
                  ),
                ),
                Card(
                  child: ListTile(
                    onTap: () {},
                    trailing: const Text(
                      "Support",
                      style: TextStyle(),
                    ),
                    leading: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Support(),
                        ));
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                      ),
                    ),
                    contentPadding: const EdgeInsets.only(top: 5, left: 5),
                    minLeadingWidth: 76.w,
                  ),
                ),
                Card(
                  child: ListTile(
                    onTap: () {},
                    trailing: const Text(
                      "Log out",
                      style: TextStyle(),
                    ),
                    leading: IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text(
                                  "Logout",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                content: const Text(
                                  "Are you sure?",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            AppColors.primaryColor),
                                    child: const Text(
                                      "Cancel",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => LoginScreen(),
                                      ));
                                    },
                                    style: OutlinedButton.styleFrom(
                                        side: const BorderSide(
                                            color: AppColors.primaryColor),
                                        backgroundColor:
                                            AppColors.primaryColor),
                                    child: const Text(
                                      "Sure",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                      ),
                    ),
                    contentPadding: const EdgeInsets.only(top: 5, left: 5),
                    minLeadingWidth: 75.w,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
