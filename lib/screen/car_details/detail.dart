// import 'package:cardoctor/Models/current_aap_user.dart';
// import 'package:cardoctor/res/color.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class CarDetail extends StatefulWidget {
//   const CarDetail({super.key});

//   @override
//   State<CarDetail> createState() => _CarDetailState();
// }

// class _CarDetailState extends State<CarDetail> {
//   @override
//   Widget build(BuildContext context) {
//     final uid = CurrentAppUser.currentUserData.uid ??
//         CurrentMechanicUser.currentUserMechanicData.uid ??
//         null;
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: AppColors.primaryColor, title: Text("Car Detail")),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('garage')
//             .doc(uid)
//             .collection('cars')
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else {
//             return Column(children: [
              
                           
//             ],)
//           }
//         },
//       ),
//     );
//   }
// }
