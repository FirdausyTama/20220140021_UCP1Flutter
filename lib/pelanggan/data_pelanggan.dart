import 'package:flutter/material.dart';

class DataPelanggan extends StatefulWidget {
  const DataPelanggan({super.key});

  @override
  State<DataPelanggan> createState() => _DataPelangganState();
}

class _DataPelangganState extends State<DataPelanggan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, 
        centerTitle: true, 
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Data Pelanggan',
          style: TextStyle(color: Colors.white), 
        ),
      ),
      body: Padding(padding: EdgeInsets.all(20),
      child: Form(
        child: 
        Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 45),
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0, bottom: 10.0),
                    child: Text(
                      'Nama Lengkap',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              TextFormField(
                //controller: namaController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Nama Lengkap',
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(16),
                    child: Icon(Icons.person),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
          ],
        )),),
    );
  }
}