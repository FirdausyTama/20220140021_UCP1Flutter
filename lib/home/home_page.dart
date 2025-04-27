import 'package:flutter/material.dart';
import 'package:ucp1/auth/login_page.dart';
import 'package:ucp1/barang/data_barang.dart';
import 'package:ucp1/pelanggan/data_pelanggan.dart';
import 'package:ucp1/piket/data_piket.dart';

class HomePage extends StatelessWidget {
  final String email;
  const HomePage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.blue,
            padding: const EdgeInsets.only(
              top: 35,
              left: 10,
              right: 10,
              bottom: 20,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/profil.jpg'),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selamat Datang',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        email,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                IconButton(
                  icon: Icon(
                    Icons.logout_outlined,
                    color: Colors.white,
                    size: 28,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 30, bottom: 30, left: 10, right: 10),
            width: 380,
            height: 180,
            color: const Color.fromARGB(255, 3, 115, 171),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/images/makan.png'),
                  height: 350,
                  width: 200,
                ),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dapatkan diskon\n25% disetiap \nharinya',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),

                    FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: Text('Order Now'),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: FilledButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DataPiket(),
                            ),
                            
                          );
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.touch_app_outlined,
                              size: 50,
                              color: Colors.white,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Data Piket',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: FilledButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DataPelanggan(),
                            ),
                            
                          );
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person_add_sharp,
                              size: 50,
                              color: Colors.white,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Data Pelanggan',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                width: 400,
                height: 220,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: FilledButton(
                    onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DataBarang()),
                      
                      );
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.article_outlined,
                          size: 50,
                          color: Colors.white,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Barang Masuk/Keluar',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
