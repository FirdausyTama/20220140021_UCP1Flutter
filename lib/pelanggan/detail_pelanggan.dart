import 'package:flutter/material.dart';

class DetailPelanggan extends StatefulWidget {
  final String nama;
  const DetailPelanggan({super.key, required this.nama});

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
          'Detail ${widget.nama}',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
