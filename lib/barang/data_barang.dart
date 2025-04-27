import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ucp1/barang/detail_barang.dart';

class DataBarang extends StatefulWidget {
  const DataBarang({super.key});

  @override
  State<DataBarang> createState() => _DataBarangState();
}

class _DataBarangState extends State<DataBarang> {
  final _formKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();
  final TextEditingController barangController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  int totalHarga = 0;

  final Map<String, double> hargaBarang = {
    'Carrier': 540000,
    'Sleeping Bag': 250000,
    'Tenda': 700000,
    'Sepatu': 350000,
  };

  String? _selectedJenisBarang;
  String? _selectedJenisTransaksi;
  DateTime? _selectedDate;
  final List<Map<String, String>> piketData = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    barangController.dispose();
    hargaController.dispose();
    super.dispose();
  }

  void addTask() {
    setState(() {
      piketData.add({
        'tanggal': DateFormat(
          'EEEE, d MMMM yyyy',
          'id_ID',
        ).format(_selectedDate!),
      });
      _selectedDate = null;
    });

    Future.delayed(const Duration(milliseconds: 300), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
        );
      }
    });
  }

  String formatRupiah(double nilai) {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: '',
      decimalDigits: 0,
    );
    return formatter.format(nilai).trim();
  }

  void updateHarga(String? jenisBarang) {
    if (jenisBarang != null && hargaBarang.containsKey(jenisBarang)) {
      setState(() {
        _selectedJenisBarang = jenisBarang;
        hargaController.text = formatRupiah(hargaBarang[jenisBarang]!);
      });
    }
  }

  void calculateTotalPrice() {
    int jumlahBarang = int.tryParse(barangController.text) ?? 0;
    double hargaSatuan = _selectedJenisBarang != null ? 
                        hargaBarang[_selectedJenisBarang]! : 0;

    setState(() {
      totalHarga = (jumlahBarang * hargaSatuan).toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Pendataan Barang', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Tanggal Transaksi',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText:
                      _selectedDate == null
                          ? 'Tanggal Transaksi'
                          : DateFormat(
                            'EEEE, d MMMM yyyy',
                            'id_ID',
                          ).format(_selectedDate!),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Icon(Icons.date_range_outlined),
                  ),
                ),
                onTap: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _selectedDate = pickedDate;
                    });
                  }
                },
                validator: (value) {
                  if (_selectedDate == null) {
                    return 'Tanggal tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              const Text(
                'Jenis Transaksi',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Jenis Transaksi',
                ),
                value: _selectedJenisTransaksi,
                items:
                    ['Barang Masuk', 'Barang Keluar'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedJenisTransaksi = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Jenis transaksi harus dipilih';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              const Text(
                'Jenis Barang',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Jenis Barang',
                ),
                value: _selectedJenisBarang,
                items:
                    hargaBarang.keys.toList().map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                onChanged: (value) {
                  updateHarga(value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Jenis barang harus dipilih';
                  }
                  return null;
                },
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
                            'Jumlah Barang',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextFormField(
                          controller: barangController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: 'Jumlah Barang',
                          ),
                          onChanged: (_) {
                            calculateTotalPrice();
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Jumlah Barang tidak boleh kosong';
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
                            'Harga Satuan',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextFormField(
                          controller: hargaController,
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: 'Harga Satuan',
                            prefixIcon: const Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                'Rp.',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Harga Satuan tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      calculateTotalPrice();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailBarang(
                            tanggal: _selectedDate!,
                            jenisTransaksi: _selectedJenisTransaksi!,
                            jenisBarang: _selectedJenisBarang!,
                            jumlahBarang: int.parse(barangController.text),
                            hargaSatuan: hargaBarang[_selectedJenisBarang]!,
                            totalHarga: totalHarga,
                          ),
                        ),
                      );
                    }
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}