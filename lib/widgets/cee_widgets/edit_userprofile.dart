import 'package:flutter/material.dart';

class EditUserprofile extends StatelessWidget {
  const EditUserprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              "https://scontent.fbwa1-1.fna.fbcdn.net/v/t39.30808-6/367423224_2659174784245979_1607151805930275744_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=eRyI1OBMo1kQ7kNvwH6gecg&_nc_oc=AdlvCjDiDK81NHY47uoADzQQM2IChlCQ2vEMQIDfobPr-eDYFI3ODQs5nUIJm1lnFydbSg--gh4RtnkhzmgACcVj&_nc_zt=23&_nc_ht=scontent.fbwa1-1.fna&_nc_gid=KTazOEMsIzAhAqscYdgmEw&oh=00_AfZVCdsFo_JPGP28SpLmVtGttgJ14Juadoc7Q6vylSUejQ&oe=68DA70DF",
            ),
          ),
          Text(
            "Sandip Y.",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "CEE",
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
