import 'package:flutter/material.dart';
import 'package:medi_app/color/colors.dart';

import 'image_details.dart';

class Images extends StatefulWidget {
  const Images({super.key});

  @override
  State<Images> createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  bool tap = false;
  int selected = 0;
  List img = [
    'assets/young-blonde-woman-sportswear-is-meditating-yoga-mat-with-closed-eyes.jpg',
    'assets/sporty-young-woman-doing-yoga-practice-isolated-concept-healthy-life-natural-balance-body-mental-development.jpg',
    'assets/side-view-woman-doing-yoga-outdoors.jpg',
    'assets/portrait-young-beautiful-sportive-girl-white-background.jpg',
    'assets/kike-vega-F2qh3yjz6Jk-unsplash.jpg',
    'assets/kike-vega-F2qh3yjz6Jk-unsplash (1).jpg',
  ];
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: mblack,
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(bottom: 200),
            itemCount: img.length,
            itemBuilder: (context, index) {
              return InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  print(img[index]);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ImageDetail(
                              img: img[index],
                            )),
                  );
                },
                onTapCancel: () {
                  setState(() {
                    selected = index;
                    tap = false;
                  });
                },
                onTapDown: (_) {
                  setState(() {
                    selected = index;
                    tap = true;
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    selected = index;
                    tap = false;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: h / 4,
                    width: w,
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(16)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        img[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ]),
    );
  }
}
