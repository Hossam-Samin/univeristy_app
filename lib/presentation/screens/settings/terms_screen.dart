import 'package:flutter/material.dart';

class TermsAndCondition extends StatelessWidget {
  TermsAndCondition({Key? key, required this.text}) : super(key: key);

  String text = "I am flutter developer in company";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Terms & Condition",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        backgroundColor: Colors.white,
        elevation: 1.0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: const [
          Card(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            color: Color.fromARGB(31, 241, 238, 238),
            child: ListTile(
              minVerticalPadding: 80,
              subtitle: Center(
                child:
                    // No back data
                    CircularProgressIndicator(),
              ),
              contentPadding:
                  EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
            ),
          ),
        ],
      ),
    );
  }
}
