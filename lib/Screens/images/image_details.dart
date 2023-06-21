import 'package:flutter/material.dart';
import 'package:medi_app/color/colors.dart';

import '../../widget/icon_button.dart';

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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomIconButton(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          color: black,
                          icon: Icons.arrow_back_outlined,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              CustomIconButton(
                                onTap: () {},
                                color: black,
                                icon: Icons.share_outlined,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              CustomIconButton(
                                  onTap: () {},
                                  color: black,
                                  icon: Icons.file_download_outlined),
                            ],
                          ),
                        ),
                      ]),
                ),
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
