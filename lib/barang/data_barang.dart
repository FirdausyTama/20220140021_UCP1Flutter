import 'package:flutter/material.dart';

class DataBarang extends StatefulWidget {
  const DataBarang({super.key});

  @override
  State<DataBarang> createState() => _DataBarangState();
}

class _DataBarangState extends State<DataBarang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        backgroundColor: Colors.blue, 
        centerTitle: true, 
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Pendataan Barang',
          style: TextStyle(color: Colors.white), 
        ),
      ),
    );
  }
}