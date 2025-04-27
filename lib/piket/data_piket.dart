import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataPiket extends StatefulWidget {
  final String email;
  const DataPiket({super.key, required this.email});

  @override
  State<DataPiket> createState() => _DataPiketState();
}

class _DataPiketState extends State<DataPiket> {
  late TextEditingController namaController;
  final TextEditingController _taskCtr = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();

  DateTime? _selectedDate;
  final List<Map<String, String>> piketData = [];

  @override
  void initState() {
    super.initState();
    namaController = TextEditingController(text: widget.email);
  }

  @override
  void dispose() {
    namaController.dispose();
    _taskCtr.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void addTask() {
    setState(() {
      piketData.add({
        'nama': namaController.text,
        'tanggal': DateFormat('EEEE, d MMMM yyyy').format(_selectedDate!),
        'tugas': _taskCtr.text,
      });
      _selectedDate = null;
      _taskCtr.clear();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Piket Gudang',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                'Nama Anggota',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: namaController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Nama Anggota',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Pilih Tanggal',
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
                          ? 'Pilih Tanggal'
                          : DateFormat(
                            'EEEE, d MMMM yyyy',
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
              const SizedBox(height: 20),
              const Text(
                'Tugas Piket',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _taskCtr,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Tugas Piket',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Tugas tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: FilledButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate() &&
                            _selectedDate != null) {
                          addTask();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Tugas berhasil ditambahkan'),
                              backgroundColor: Colors.green,
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.only(
                                bottom: 70,
                                left: 20,
                                right: 20,
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
                      child: const Text('Tambah'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Daftar Tugas Piket',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child:
                    piketData.isEmpty
                        ? const Center(
                          child: Text(
                            'Belum ada data piket',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        )
                        : ListView.builder(
                          controller: _scrollController,
                          itemCount: piketData.length,
                          itemBuilder: (context, index) {
                            final data = piketData[index];
                            return Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[200],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [const SizedBox(height: 4)],
                              ),
                            );
                          },
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
