import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psc_app/screens/cee_screens/cee_edit_profile.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => CeeEditProfile());
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,

            backgroundImage: NetworkImage(
              "https://scontent.fbwa1-1.fna.fbcdn.net/v/t39.30808-6/468044138_122149592840296239_5089078390316523783_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=cc71e4&_nc_ohc=zrg5BJ8VDYYQ7kNvwHQgtxF&_nc_oc=AdmguFpled2Iln-lg9s52ggx7wotflFrgHOCSoOGOwr4MHuNZ5crtbDzo2w-ESzHceFRElhSppYs79pck1fQvfZa&_nc_zt=23&_nc_ht=scontent.fbwa1-1.fna&_nc_gid=NGalXNPio8rXqs4Pw18afQ&oh=00_AfYScEf8ZMlGYRMSJ_KVw2NaTgkp8zRoFUGJ7QLW_wM0BA&oe=68DA5894",
              scale: 2.0,
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sandip Yadav",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
              Text(
                "9800772124",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                "sandy@gmail.com",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
