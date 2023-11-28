import 'package:bhaladawala_app/custom_class/custom_appbar.dart';
import 'package:bhaladawala_app/custom_class/custom_divider.dart';
import 'package:bhaladawala_app/custom_class/progessbar_with_appcolor.dart';
import 'package:bhaladawala_app/custom_class/snack_bar.dart';
import 'package:bhaladawala_app/model/get_order_model.dart';
import 'package:bhaladawala_app/repo/order_repo.dart';
import 'package:bhaladawala_app/utils/app_colors.dart';
import 'package:bhaladawala_app/utils/app_fonts.dart';
import 'package:bhaladawala_app/utils/app_image_assets.dart';
import 'package:bhaladawala_app/utils/app_strings.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  final orderRepo = OrderRepo();
  bool isLoading = false;
  bool isShow = false;
  List<GetOrderData>? getOrderData;

  @override
  void initState() {
    super.initState();
    getOrderList();
  }

  void getOrderList() async {
    setState(() {
      isLoading = true;
    });
    getOrderData = await orderRepo.getOrder();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.customBackground,
        appBar: const CustomAppBar(
          appBarText: AppStrings.textMyOrder,
          appBarBackArrow: false,
        ),
        body: isLoading
            ? const Center(
                child: ProgressBarWithAppColor(),
              )
            : getOrderData?.length != 0
                ? Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Stack(
                      children: [
                        ListView.builder(
                            itemCount: getOrderData?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                color: AppColors.white,
                                margin: const EdgeInsets.all(8),
                                elevation: 0,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.209,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              height: MediaQuery.of(context).size.height * 0.15,
                                              width: MediaQuery.of(context).size.height * 0.7,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: AppColors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    width: 100,
                                                    height: 80,
                                                    child: CachedNetworkImage(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.15,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.7,
                                                        imageUrl: orderRepo.getOrderData?[index].image ??
                                                            ''),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        bottom: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.02,
                                                        left: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.04,
                                                        top: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.06),
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.4,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          orderRepo
                                                                  .getOrderData?[
                                                                      index]
                                                                  .name ??
                                                              '',
                                                          style:
                                                              const TextStyle(
                                                            color:
                                                                AppColors.black,
                                                            fontSize: 16,
                                                            fontFamily: AppFonts
                                                                .fontInterMedium,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.005),
                                                        Text(
                                                            "${orderRepo.getOrderData?[index].qty} Unit",
                                                            style: TextStyle(fontSize: 16, color: AppColors.greyShade800)),
                                                        SizedBox(
                                                          height: MediaQuery.of(context).size.height * 0.045,
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                orderRepo.getOrderData?[
                                                                  index].salePrice ??
                                                                    '',
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 17,
                                                                  fontFamily:
                                                                      AppFonts
                                                                          .fontInterMedium,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.01,
                                                              ),
                                                              Text(
                                                                orderRepo.getOrderData?[index].regularPrice ?? '',
                                                                style: const TextStyle(
                                                                    fontSize: 16,
                                                                    color: Colors.grey,
                                                                    decoration: TextDecoration.lineThrough),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const CustomDivider(),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.03,
                                                  left: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.02),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    orderRepo
                                                            .getOrderData?[
                                                                index]
                                                            .createdAt ??
                                                        '',
                                                    style: const TextStyle(
                                                      color: AppColors.grey,
                                                      fontSize: 14,
                                                      fontFamily: AppFonts
                                                          .fontInterMedium,
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color:
                                                            AppColors.appColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    margin: EdgeInsets.only(
                                                        left: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.07),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.14,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.04,
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            AppColors.appColor,
                                                      ),
                                                      onPressed: () async {
                                                        setState(() {
                                                          isLoading = true;
                                                        });
                                                        final message = await orderRepo.reGeneratedOrder(
                                                            orderRepo.getOrderData?[index].orderId.toString() ?? '',
                                                            orderRepo.getOrderData?[index].productId ??'');
                                                        setState(() {
                                                          isLoading = false;
                                                        });

                                                        if (message == "1") {
                                                          successSnackBar('You reorder successfully');
                                                        } else {
                                                          errorSnackBar(message);
                                                        }
                                                      },
                                                      child: Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                            ImageAssets
                                                                .reorderIcon,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.02,
                                                          ),
                                                          const SizedBox(
                                                              width: 8),
                                                          const Text(
                                                           AppStrings.textReOrder,
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontFamily: AppFonts
                                                                    .fontInterRegular),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                        // Text("No more order placed!")
                      ],
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.2,
                            left: MediaQuery.of(context).size.height * 0.03),
                        child: SvgPicture.asset(
                          ImageAssets.noOrderPlacedIcon,
                          height: MediaQuery.of(context).size.height * 0.15,
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.03,
                          ),
                          child: const Text(
                              textAlign: TextAlign.center,
                              AppStrings.textNoOrderPlaced,
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: AppFonts.fontInterBold,
                              ))),
                      Container(
                          padding: const EdgeInsets.all(30),
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.03,
                          ),
                          child: const Text(
                            textAlign: TextAlign.center,
                            AppStrings.textNoOrderPlacedSubTitle,
                            style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 14,
                              fontFamily: AppFonts.fontInterRegular,
                            ),
                          )),
                    ],
                  ),
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
