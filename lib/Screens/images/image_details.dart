import 'package:flutter/material.dart';
import 'package:medi_app/color/colors.dart';

class ImageDetail extends StatelessWidget {
  const ImageDetail({super.key, required this.img});
  final String img;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: mblack,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: CircleAvatar(
                                backgroundColor: black.withOpacity(0.8),
                                child: Icon(
                                  Icons.arrow_back_outlined,
                                  color: white,
                                ))),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: CircleAvatar(
                                    backgroundColor: black.withOpacity(0.8),
                                    child: Icon(
                                      Icons.share_outlined,
                                      color: white,
                                      fill: 1,
                                      opticalSize: 20,
                                    ))),
                            IconButton(
                                onPressed: () {},
                                icon: CircleAvatar(
                                    backgroundColor: black.withOpacity(0.8),
                                    child: Icon(
                                      Icons.file_download_outlined,
                                      color: white,
                                    ))),
                          ],
                        ),
                      ),
                    ]),
                height: h,
                width: w,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          img,
                        ),
                        fit: BoxFit.cover)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
