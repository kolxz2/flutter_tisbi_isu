import 'package:flutter/material.dart';
import 'package:flutter_tisbi_isu/resources/resources.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: 340,
              width: 340,
              decoration: new BoxDecoration(
                color: Colors.cyanAccent,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.white.withOpacity(0.5),
                    Colors.white.withOpacity(0.5),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("СУЧЁВ \nНИКОЛАЙ \nЕВГЕНЬЕВИЧ",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        CircleAvatar(
                          backgroundImage: AssetImage(
                            Images.photoMy,
                          ),
                          radius: 55,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        """Группа: П-011\nДата рождения: 17.02.2001\nФакультет: "Информационные технологии"\nНаправление: "Программная инженерия"\nФорма обучения: Очная""",
                        style: TextStyle(fontSize: 20, color: Colors.white))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 340,
              width: 340,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(Images.qrCode),
                  fit: BoxFit.contain,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 100,
        )
      ],
    );
  }
}
