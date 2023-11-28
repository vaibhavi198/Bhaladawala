import 'package:bhaladawala_app/utils/app_colors.dart';
import 'package:bhaladawala_app/utils/app_fonts.dart';
import 'package:bhaladawala_app/utils/app_image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomContainer extends StatelessWidget {
  final String text;
  final bool isShowArrow;
  final bool isShowForwardArrow;
  final String text2;
  final Color? containerTextColor;
  final bool? value;
  final ValueChanged<bool>? onSwitchChanged;

  const CustomContainer({
    super.key,
    required this.text,
    this.isShowArrow = false,
    this.isShowForwardArrow = true,
    required this.text2,
    this.containerTextColor,
    this.value,
    this.onSwitchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          height: MediaQuery.of(context).size.height * 0.06,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height * 0.02,
                ),
                child: Text(
                  text,
                  style: TextStyle(
                    color: containerTextColor,
                    fontSize: 16,
                    fontFamily: AppFonts.fontInterMedium,
                  ),
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){

                    },
                    child: Visibility(
                      visible: isShowArrow,
                      child: SvgPicture.asset(
                        ImageAssets.whatsAppIcon,
                      ),
                    ),
                  ),



                 /* GestureDetector(
                    onTap: () {
                      widget.onChanged(!widget.value);
                    },
                    child: Container(
                      width: 70.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: widget.value ? Colors.green : Colors.grey,
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: widget.value ? 40.0 : 2.0,
                            top: 2.0,
                            child: Container(
                              width: 26.0,
                              height: 26.0,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),*/
                  Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: Text(text2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: AppColors.black,
                              fontSize: 16,
                              fontFamily: AppFonts.fontInterRegular))),
                  Visibility(
                    visible: isShowForwardArrow,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.black,
                      ), onPressed: () {  },
                    ),
                  ),
                ],
              )
            ],
          )),
    ]);
  }
}
