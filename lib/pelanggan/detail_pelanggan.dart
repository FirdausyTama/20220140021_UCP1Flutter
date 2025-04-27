import 'package:flutter/material.dart';

class DetailPelanggan extends StatefulWidget {
  const DetailPelanggan({super.key});

  @override
  State<DetailPelanggan> createState() => _DetailPelangganState();
}

class _DetailPelangganState extends State<DetailPelanggan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, 
        centerTitle: true, 
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Detail (Pelanggan)',
          style: TextStyle(color: Colors.white), 
        ),
      ),
    );
  }
}