import 'package:flutter/Material.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    this.onTap,
    this.isLoading = false,
    required this.text,
    this.backgroundColor = Colors.black,
    this.textColor = Colors.white,
    required this.width,
    required this.height,
    this.radius = 30,
  });
  final void Function()? onTap;
  final bool isLoading;
  final String text;
  final Color backgroundColor, textColor;
  final double width, height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(radius)),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  height: 27,
                  width: 27,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                )
              : Text(
                  text,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
        ),
      ),
    );
  }
}

class CustomIconBtn extends StatelessWidget {
  const CustomIconBtn({
    super.key,
    this.onTap,
    this.isLoading = false,
    required this.text,
    this.backgroundColor = Colors.black,
    this.textColor = Colors.white,
    required this.icon,
    required this.width,
    required this.height,
    this.radius = 30,
  });
  final void Function()? onTap;
  final bool isLoading;
  final String text;
  final Color backgroundColor, textColor;
  final Widget icon;
  final double width, height, radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          width: width,
          height: 50,
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(radius)),
          child: Center(
            child: isLoading
                ? const SizedBox(
                    height: 27,
                    width: 27,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        text,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      icon,
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
