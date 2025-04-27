import 'package:flutter/material.dart';
import 'package:ucp1/home/home_page.dart';

class DetailPelanggan extends StatefulWidget {
  final String nama;
  final String email;
  final String nohp;
  final String alamat;
  final String provinsi;
  final String pos;
  const DetailPelanggan({
    super.key,
    required this.nama,
    required this.email,
    required this.nohp,
    required this.alamat,
    required this.pos,
    required this.provinsi,
  });

  @override
  State<DetailPelanggan> createState() => _DetailPelangganState();
}

class _DetailPelangganState extends State<DetailPelanggan> {
  late TextEditingController alamatController;
  late TextEditingController provinsiController;
  late TextEditingController posController;

  @override
  void initState() {
    super.initState();
    alamatController = TextEditingController(text: widget.alamat);
    provinsiController = TextEditingController(text: widget.provinsi);
    posController = TextEditingController(text: widget.pos);
  }

  @override
  void dispose() {
    alamatController.dispose();
    provinsiController.dispose();
    posController.dispose();
    super.dispose();
  }

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
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/profil.jpg'),
              ),
              SizedBox(height: 20),
              Text(
                widget.nama,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(widget.email, style: TextStyle(fontSize: 15)),
              SizedBox(height: 5),
              Text(widget.nohp, style: TextStyle(fontSize: 15)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                          child: Text(
                            'Email',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextFormField(
                          controller: alamatController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: 'Email',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                          child: Text(
                            'Provinsi',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextFormField(
                          controller: provinsiController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: 'Provinsi',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Provinsi tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                          child: Text(
                            'Kode Pos',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextFormField(
                          controller: posController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: 'Kode Pos',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Kode Pos tidak boleh kosong';
                            } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                              return 'Kode Pos hanya boleh angka';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              SizedBox(
                width: 400,
                height: 56,
                child: FilledButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(email: ''),
                      ),(Route<dynamic> route) => false,
                    );
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('Selesai'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
