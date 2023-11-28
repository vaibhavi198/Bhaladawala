import 'package:bhaladawala_app/custom_class/snack_bar.dart';
import 'package:bhaladawala_app/model/home_model.dart';
import 'package:bhaladawala_app/repo/cart_repo.dart';
import 'package:bhaladawala_app/screens/product_list/product_detail.dart';
import 'package:bhaladawala_app/utils/app_colors.dart';
import 'package:bhaladawala_app/utils/app_fonts.dart';
import 'package:bhaladawala_app/utils/app_image_assets.dart';
import 'package:bhaladawala_app/utils/app_strings.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LimitedPeriodDeals extends StatefulWidget {
  List<LimitDealData> list;
   LimitedPeriodDeals( {super.key, required this.list});

  @override
  State<LimitedPeriodDeals> createState() => _LimitedPeriodDealsState();
}

class _LimitedPeriodDealsState extends State<LimitedPeriodDeals> {
  bool isLoading = false;
  final cartRepo = AddCartRepo();
  String selectedValue = "Unit";
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
      height: MediaQuery.of(context).size.height * 0.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.list.length,
        itemBuilder: (context, index) {

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>  ProductDetailScreen(id: widget.list[index].id.toString(),)),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(children: [
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: MediaQuery.of(context).size.width * 0.28,
                      height: MediaQuery.of(context).size.height * 0.12,
                      margin: const EdgeInsets.all(3),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(imageUrl: widget.list[index].image.toString() ?? '',fit: BoxFit.cover,))),
                  InkWell(
                    onTap: () async{
                      setState(() {
                        isLoading = true;
                      });

                      final message = await cartRepo.addToCart(
                          widget.list[index].id.toString() ?? '',
                          selectedValue,
                          selectedValue == AppStrings.unit ? widget.list[index].unitQty ?? '' : '1',
                          selectedValue == AppStrings.unit ? widget.list[index].unitRegularPrice ?? '' : widget.list[index].quantityRegularPrice ?? '',
                          selectedValue == AppStrings.unit ? widget.list[index].unitSalePrice ?? '' : widget.list[index].quantitySalePrice ?? '');

                      setState(() {
                        isLoading = false;
                      });
                      if (message == '1') {
                        successSnackBar(AppStrings.theProductIsAddedToCart);
                      } else {
                        errorSnackBar(message);
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height * 0.098,
                          top: MediaQuery.of(context).size.height * 0.010),
                      height: MediaQuery.of(context).size.height * 0.03,
                      width: MediaQuery.of(context).size.width * 0.08,
                      decoration: const BoxDecoration(
                        color: AppColors.appColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: const Center(
                          child: Icon(
                        Icons.add,
                        size: 20,
                        color: Colors.white,
                      )),
                    ),
                  ),
                ]),
                Container(
                    margin: const EdgeInsets.all(5),
                    child:  Text(
                      widget.list[index].name ?? '',
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: AppFonts.fontInterMedium,
                      ),
                    ))
              ],
            ),
          );
        },
      ),
    );
  }

  void  successSnackBar(String message) {
    ReusableSnackBar.show(context, message,
        isSuccess: true);
  }

  void errorSnackBar(String message) {
    ReusableSnackBar.show(context, message);
  }
}
