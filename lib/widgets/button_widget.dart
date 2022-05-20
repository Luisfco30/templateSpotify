import 'package:flutter/material.dart';
import 'package:examen1p/shared/responsive.dart';

class ButtonWidget extends StatelessWidget {
  final String? title;
  final bool? hasColor;
  final void Function()? onPressed;
  final Color? color;
  final double? height;
  final double? whidth;
  final double? fontSize;
  final bool? otherColor;
  final Color? colorButton;

  const ButtonWidget({
    Key? key,
    this.title,
    this.hasColor,
    this.color,
    this.height = 60.0,
    this.whidth = -1.0,
    this.fontSize,
    this.otherColor = false,
    this.colorButton = Colors.green,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontSizeButton = 0;

    if (isTab(context) || isDesktop(context)) {
      fontSizeButton = fontSize ?? 20;
    } else if (isMobile(context)) {
      fontSizeButton = fontSize ?? 14;
    }
    return Material(
      borderRadius: BorderRadius.circular(4),
      child: Ink(
        decoration: BoxDecoration(
            color: hasColor!
                ? Colors.white
                : otherColor!
                    ? colorButton
                    : Colors.blueGrey),
        child: InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: onPressed,
          child: SizedBox(
            height: height,
            width: whidth! < 0 ? MediaQuery.of(context).size.width : whidth!,
            child: Center(
                child: Text(
              title!,
              style: TextStyle(
                color: hasColor! ? Colors.black12 : Colors.white,
                fontWeight: FontWeight.w400,
              ),
            )),
          ),
        ),
      ),
    );
  }
}
