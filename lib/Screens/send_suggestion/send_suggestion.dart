import 'package:flutter/material.dart';
import 'package:medi_app/color/colors.dart';
import 'package:medi_app/widget/custom_button.dart';
import 'package:sizer/sizer.dart';

import '../../widget/custom_text.dart';

class SendSuggestion extends StatefulWidget {
  const SendSuggestion({super.key});

  @override
  State<SendSuggestion> createState() => _SendSuggestionState();
}

class _SendSuggestionState extends State<SendSuggestion> {
  bool tap = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mblack,
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.topLeft,
              child: InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  onTapDown: (_) {
                    setState(() {
                      tap = true;
                    });
                  },
                  onTapUp: (_) {
                    setState(() {
                      tap = false;
                    });
                  },
                  onTapCancel: () {
                    setState(() {
                      tap = false;
                    });
                  },
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 50),
                    opacity: tap ? 0.3 : 1,
                    child: CircleAvatar(
                        backgroundColor: white.withOpacity(0.3),
                        child: Icon(
                          Icons.arrow_back_outlined,
                          color: white,
                        )),
                  )),
            ),
          ),
          CustomText(
            color: white,
            text: "Leave FeedBack!",
            fontSize: 23.sp,
            fontWeight: FontWeight.normal,
          ),
          SizedBox(
            height: 20,
          ),
          CustomText(
            color: white,
            text:
                "We appreciate your feedback and continuously strive to enhance our services to provide you with the best server experience",
            fontSize: 15.sp,
            fontWeight: FontWeight.normal,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              maxLines: 4,
              decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: malloy,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: malloy),
                  ),
                  hintText: 'Type your message here',
                  hintStyle: TextStyle(
                    color: malloy,
                    fontFamily: "Merienda",
                    fontSize: 9.sp,
                    fontWeight: FontWeight.normal,
                  )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CustomButton(
            text: "Send",
            w: 200,
            onTap: () {},
          )
        ]),
      ),
    );
  }
}
