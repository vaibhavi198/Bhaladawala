import 'package:bhaladawala_app/utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarText;
  final String? appBarImage;
  final bool appBarBackArrow;
  final bool? isCustomOnTap;
  final double? height;
  final VoidCallback? onPressedCallback;
  final GestureTapCallback? onTap;

  @override
  final Size preferredSize;

  const CustomAppBar(
      {super.key,
      required this.appBarText,
      this.appBarImage,
      this.appBarBackArrow = false,
      this.onPressedCallback,
        this.onTap,
        this.isCustomOnTap = false,
      this.height = 0})
      : preferredSize = const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.023,
          left: 20,
          right: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Visibility(
                    visible: appBarBackArrow,
                    child: InkWell(
                      onTap: isCustomOnTap != false ? onTap :() {
                        Navigator.of(context).pop();
                      },
                        child: const Icon(Icons.arrow_back))),
                Visibility(
                  visible: appBarBackArrow,
                  child: const SizedBox(
                    width: 10,
                  ),
                ),
                Text(appBarText,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: AppFonts.fontInterBold,
                    )),
              ],
            ),
            GestureDetector(
              onTap: onPressedCallback,
              child: SvgPicture.asset(appBarImage ?? "",
                height: height ,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
    );
  }
}
