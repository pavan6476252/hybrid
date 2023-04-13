import 'package:flutter/material.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            const CircleAvatar(
                radius: 23,
                child: Icon(
                  Icons.person_2,
                  size: 35,
                )),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Pavan Kumar",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "@pavan_kumar",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            )
          ]),
          const CircleAvatar(child: Icon(Icons.search_rounded))
        ],
      ),
    );
  }

  // static final _appBar = AppBar();
  @override
  Size get preferredSize => Size(double.maxFinite, 80);
}
