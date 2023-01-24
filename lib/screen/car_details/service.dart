import 'package:cardoctor/Models/current_aap_user.dart';
import 'package:cardoctor/components/button.dart';
import 'package:cardoctor/notification_handler.dart';
import 'package:cardoctor/res/color.dart';
import 'package:cardoctor/screen/homescreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ServiceCategory extends StatefulWidget {
  const ServiceCategory({super.key, required this.carId});

  final String carId;
  State<ServiceCategory> createState() => _ServiceCategoryState();
}

class _ServiceCategoryState extends State<ServiceCategory> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController cost = TextEditingController();
  TextEditingController mileage = TextEditingController();
  TextEditingController serviceDate = TextEditingController();
  TextEditingController nextDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text("SERVICE CATEGORY"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Icon(Icons.emoji_transportation,
            //         color: AppColors.primaryIconColor, size: 30),
            //     SizedBox(
            //       width: 30,
            //     ),
            //     Text(
            //       "SERVICE",
            //       style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           fontSize: 25.0,
            //           color: AppColors.primaryIconColor),
            //     ),
            //   ],
            // ),
            Padding(
              padding: EdgeInsets.only(top: 40, left: 20, right: 20),
              child: Container(
                // height: 500.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: AppColors.successColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8.0,
                      offset: Offset(0.0, 5.0),
                    ),
                  ],
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: Colors.grey.shade400,
                            ),
                            Text(
                              "SERVICE DATE",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Colors.grey.shade400),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: TextFormField(
                            controller: serviceDate,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'required';
                              } else
                                return null;
                            },
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.currency_rupee_sharp),
                                hintText: 'Service Date',
                                labelText: 'Service Date',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                hintStyle: TextStyle(
                                  color: AppColors.hintColor,
                                  fontWeight: FontWeight.normal,
                                ),
                                labelStyle: TextStyle(
                                    color: AppColors.hintColor,
                                    fontWeight: FontWeight.normal)),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.currency_rupee_sharp,
                              color: Colors.grey.shade400,
                            ),
                            Text(
                              "COST (PKR)",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Colors.grey.shade400),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: TextFormField(
                            controller: cost,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'required';
                              } else
                                return null;
                            },
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.currency_rupee_sharp),
                                hintText: 'Cost',
                                labelText: 'Cost',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                hintStyle: TextStyle(
                                  color: AppColors.hintColor,
                                  fontWeight: FontWeight.normal,
                                ),
                                labelStyle: TextStyle(
                                    color: AppColors.hintColor,
                                    fontWeight: FontWeight.normal)),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.social_distance,
                              color: Colors.grey.shade400,
                            ),
                            Text(
                              "CURRENT MILEAGE (KM)",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Colors.grey.shade400),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: TextFormField(
                            controller: mileage,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'required';
                              } else
                                return null;
                            },
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.social_distance),
                                hintText: 'Enter Current Mileage',
                                labelText: 'Enter Current Mileage',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                hintStyle: TextStyle(
                                  color: AppColors.hintColor,
                                  fontWeight: FontWeight.normal,
                                ),
                                labelStyle: TextStyle(
                                    color: AppColors.hintColor,
                                    fontWeight: FontWeight.normal)),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: Colors.grey.shade400,
                            ),
                            Text(
                              "NEXT SERVICE DATE",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Colors.grey.shade400),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: TextFormField(
                            controller: nextDate,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'required';
                              } else
                                return null;
                            },
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.currency_rupee_sharp),
                                hintText: 'Next Service Date',
                                labelText: 'Next Service Date',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                hintStyle: TextStyle(
                                  color: AppColors.hintColor,
                                  fontWeight: FontWeight.normal,
                                ),
                                labelStyle: TextStyle(
                                    color: AppColors.hintColor,
                                    fontWeight: FontWeight.normal)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: RoundButton(
                  title: "Save",
                  onPress: () async {
                    if (_formKey.currentState!.validate()) {
                      if (DateTime.tryParse(nextDate.text) == null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Invalid Next Date Entered"),
                        ));
                        return;
                      }
                      _formKey.currentState!.save();
                      print("Cost: ${cost.text}");
                      print("Current Mileage: ${mileage.text}");
                      final uid = CurrentAppUser.currentUserData.uid ??
                          CurrentMechanicUser.currentUserMechanicData.uid;
                      if (uid == null) return;
                      await FirebaseFirestore.instance
                          .collection("garage")
                          .doc(uid)
                          .collection("cars")
                          .doc(widget.carId)
                          .update({
                        "cost": cost.text,
                        "currentMileage": mileage.text,
                        "nextServiceDate": nextDate.text,
                        "serviceDate": serviceDate.text,
                      });

                      DateTime date = DateTime.parse(nextDate.text);

                      int secondsToNextService =
                          date.difference(DateTime.now()).inSeconds;

                      await NotifyHelper.instance.scheduledNotification(
                        "Service",
                        "Your service is due today, get it serviced and maintained!",
                        secondsToNextService,
                      );

                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (_) => HomeScreen()),
                          (route) => false);
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
