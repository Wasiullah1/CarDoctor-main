import 'package:flutter/material.dart';

class CarDetail extends StatefulWidget {
  const CarDetail({super.key});

  @override
  State<CarDetail> createState() => _CarDetailState();
}

class _CarDetailState extends State<CarDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Car Detail")),
      body: Container(),
    );
  }
}
