import 'package:bhaladawala_app/model/product_list.dart';
import 'package:bhaladawala_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:bhaladawala_app/custom_class/custom_elevated_button.dart';
import 'package:bhaladawala_app/utils/app_fonts.dart';
import 'package:bhaladawala_app/utils/app_image_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomProductList extends StatelessWidget {
  final List<ProductData> productList;
   const CustomProductList( {super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productList.length,
      itemBuilder: (BuildContext context, int index) {
        return Stack(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
              height: MediaQuery.of(context).size.height * 0.51,
              width: MediaQuery.of(context).size.height * 0.7,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.04,
                left: MediaQuery.of(context).size.height * 0.037,
              ),
              height: MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.height * 0.41,
              color: Colors.grey.shade300,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.05,
              left: MediaQuery.of(context).size.height * 0.045,
            ),
            child: Image.asset(
              ImageAssets.vector,
              height: MediaQuery.of(context).size.height * 0.18,
              width: MediaQuery.of(context).size.width * 0.8,
            ),
          ),
          Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.26,
                left: MediaQuery.of(context).size.height * 0.045,
              ),
              child: const Text(
                "Natural Red Apple",
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 16,
                  fontFamily: AppFonts.fontInterMedium,
                ),
              )),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.3,
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Column(
                children: [
                  SizedBox(
                      width: 100,
                      child: CustomElevatedButton(
                        text: "Quantity",
                        onPressed: () {},
                        buttonColor: AppColors.white,
                        colorText: AppColors.appColor,
                      )),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  SizedBox(
                      width: 100,
                      child: CustomElevatedButton(
                        text: "Unit",
                        onPressed: () {},
                        buttonColor: AppColors.appColor,
                        colorText: AppColors.white,
                      )),
                ],
              ),
              SvgPicture.asset(
                ImageAssets.buyImage,
                height: 100,
              ),
            ]),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.44,
              left: MediaQuery.of(context).size.height * 0.045,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "₹199",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: AppFonts.fontInterMedium,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.height * 0.01,
                    ),
                    const Text(
                      "₹200.50",
                      style: TextStyle(
                          color: AppColors.grey,
                          fontSize: 16,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ],
                ),
                const Text(
                  textAlign: TextAlign.start,
                  "Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart.",
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 14,
                    fontFamily: AppFonts.fontInterMedium,
                  ),
                ),
              ],
            ),
          ),
        ]);
      },
    );
  }
}
