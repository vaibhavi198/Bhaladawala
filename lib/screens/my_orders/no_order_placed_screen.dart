/*
import 'package:bhaladawala_app/custom_class/custom_appbar.dart';
import 'package:bhaladawala_app/utils/app_colors.dart';
import 'package:bhaladawala_app/utils/app_fonts.dart';
import 'package:bhaladawala_app/utils/app_image_assets.dart';
import 'package:bhaladawala_app/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


 class NoOrderPlacedScreen extends StatefulWidget {
   const NoOrderPlacedScreen({super.key});

   @override
   State<NoOrderPlacedScreen> createState() => _NoOrderPlacedScreenState();
 }

 class _NoOrderPlacedScreenState extends State<NoOrderPlacedScreen> {
   @override
   Widget build(BuildContext context) {
     return  Scaffold(
       appBar: CustomAppBar(appBarText: 'My Orders',  appBarBackArrow: false,),
       body:
       Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Container(
             margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2,
                 left:MediaQuery.of(context).size.height * 0.03  ),
             child: SvgPicture.asset(
               ImageAssets.noOrderPlacedIcon,
               height: MediaQuery.of(context).size.height * 0.15,

             ),
           ),
           Container(
               margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03, ),
               child: const Text(  textAlign:  TextAlign.center,AppStrings.textNoOrderPlaced,style: TextStyle(
                 fontSize:18,
                 fontFamily: AppFonts.fontInterBold,
               ))),
           Container(
             padding: const EdgeInsets.all(30),
               margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03, ),
               child: const Text(
                 textAlign:  TextAlign.center,
                 AppStrings.textNoOrderPlacedSubTitle,
                 style: TextStyle(
                   color: AppColors.grey,
                   fontSize:14,
                   fontFamily: AppFonts.fontInterRegular,
                 ), )),



         ],
       ),


     );
   }
 }
*/
