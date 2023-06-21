import 'package:flutter/material.dart';
import 'package:simple_waveform_progressbar/simple_waveform_progressbar.dart';

import '../color/colors.dart';

class CustomIconButton extends StatefulWidget {
  const CustomIconButton(
      {super.key,
      required this.onTap,
      required this.color,
      required this.icon});
  final VoidCallback onTap;
  final Color color;
  final IconData icon;

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  bool tap = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: InkWell(
          onTap: widget.onTap,
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
            opacity: tap ? 0.3 : 0.6,
            child: CircleAvatar(
                backgroundColor: widget.color.withOpacity(0.8),
                child: Icon(
                  widget.icon,
                  color: white,
                )),
          )),
    );
  }
}
