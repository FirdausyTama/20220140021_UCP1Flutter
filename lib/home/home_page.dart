import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                spacing: 15,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/profil.jpg'),
                  ),
                  Column(
                    children: [
                      Text('Selamat Datang'),
                      Text(''),
                      
                    ],
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
