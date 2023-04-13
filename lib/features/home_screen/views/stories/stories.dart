import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  const Stories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:const  [
          Text(
            "Stories",
            style: TextStyle(fontSize: 22),
          ),
          SizedBox(height: 10),
          StoriesList()
        ],
      ),
    );
  }
}

class StoriesList extends StatelessWidget {
  const StoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => StorieCard(),
        itemCount: 5,
      ),
    );
  }
}

class StorieCard extends StatelessWidget {
  const StorieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: SizedBox(
          height: 200,
          width: 130,
        )),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text("Teja Neteti"),
        )
      ],
    );
  }
}
