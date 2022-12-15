import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          Center(
            child: Column(
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://scontent.fktm8-1.fna.fbcdn.net/v/t39.30808-6/309605804_3394726097415920_6566651795415911080_n.jpg?stp=cp6_dst-jpg&_nc_cat=106&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=vt3pyJceKu0AX83YDAw&tn=1T-70miNdbisB3Xi&_nc_ht=scontent.fktm8-1.fna&oh=00_AfCfTGmC6TtjF-nNz2GcdbwMr1xmLfY-RXHylvsJf3HsdQ&oe=63A0B805'),
                  radius: 60,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                const Text(
                  "Rj Lama",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          const Text(
            "Settings",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
