import 'package:flutter/material.dart';

class DetailPiket extends StatelessWidget {
  const DetailPiket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, 
        centerTitle: true, 
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Detail Piket',
          style: TextStyle(color: Colors.white), 
        ),
      ),
    );
  }
}
