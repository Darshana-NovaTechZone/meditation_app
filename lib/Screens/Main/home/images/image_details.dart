import 'package:flutter/material.dart';
import 'package:medi_app/color/colors.dart';

import '../../../../widget/icon_button.dart';

class ImageDetail extends StatelessWidget {
  const ImageDetail({super.key, required this.img});
  final String img;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomIconButton(
              onTap: () {
                Navigator.pop(context);
              },
              color: black,
              icon: Icons.arrow_back_outlined,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomIconButton(
                onTap: () {},
                color: black,
                icon: Icons.share_outlined,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomIconButton(
                  onTap: () {},
                  color: black,
                  icon: Icons.file_download_outlined),
            ),
          ],
        ),
        backgroundColor: mblack,
        body: SingleChildScrollView(
          child: Column(
            children: [
              InteractiveViewer(
                  child: Container(
                      alignment: Alignment.topLeft,
                      child: Image.asset(
                        img,
                        fit: BoxFit.cover,
                        height: h,
                        width: w,
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
