import 'package:bhaladawala_app/custom_class/custom_appbar.dart';
import 'package:bhaladawala_app/custom_class/custom_container.dart';
import 'package:bhaladawala_app/custom_class/custom_divider.dart';
import 'package:bhaladawala_app/custom_class/progessbar_with_appcolor.dart';
import 'package:bhaladawala_app/custom_class/snack_bar.dart';
import 'package:bhaladawala_app/model/cart_model.dart';
import 'package:bhaladawala_app/order_accepted_screen.dart';
import 'package:bhaladawala_app/repo/cart_repo.dart';
import 'package:bhaladawala_app/repo/order_repo.dart';
import 'package:bhaladawala_app/screens/home_screens/bottom_sheet.dart';
import 'package:bhaladawala_app/shared_preference/shared_preference_manager.dart';
import 'package:bhaladawala_app/utils/app_colors.dart';
import 'package:bhaladawala_app/utils/app_image_assets.dart';
import 'package:bhaladawala_app/utils/app_strings.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:bhaladawala_app/utils/app_fonts.dart';
import 'package:flutter_svg/svg.dart';



class CartScreen extends StatefulWidget {
  const CartScreen({
    super.key,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  final cartRepo = AddCartRepo();
  final orderRepo = OrderRepo();
  bool isLoading = false;
  List<CartData>? cartListData;


  @override
  void initState() {
    super.initState();
    addToCart();
    placeOrder();
  }

  addToCart() async {
    setState(() {
      isLoading = true;
    });
    cartListData = await cartRepo.getCartListItem();
    print("cartListData:::${cartListData?.length}");
    setState(() {
      isLoading = false;
    });
  }


  placeOrder() async {
    setState(() {
      isLoading = true;
    });
    await cartRepo.placeOrder();
    setState(() {
      isLoading = false;
    });
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(appBarText: AppStrings.textMyCart),
        body:  cartListData?.length != 0
            ? SizedBox(
                height: MediaQuery.of(context).size.height,
                child: isLoading
                    ? const Center(child: ProgressBarWithAppColor())
                    : ListView.builder(
                        itemCount: cartRepo.cartListData?.length,
                        itemBuilder: (BuildContext context, int index) {
                          print("CartListItem areee.....${cartListData}");


                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 12, bottom: 2),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  height: 120,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          margin: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
                                          ),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.25,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.1,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: CachedNetworkImage(
                                                placeholder: (context, url) => Image.asset(
                          ImageAssets.storeImage,
                          height: MediaQuery.of(context).size.height * 0.08,
                          ),
                                                errorWidget: (context, url, error) => Image.asset(
                          ImageAssets.storeImage,
                          height: MediaQuery.of(context).size.height * 0.08,
                          ),
                                                width: MediaQuery.of(context).size.width *
                                                    0.25,
                                                height: MediaQuery.of(context).size.height *0.1,
                                                imageUrl: cartRepo.cartListData?[index].image ?? '',
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                      ),
                                      Center(
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                cartRepo.cartListData?[index].name ?? '',
                                                style: const TextStyle(
                                                  color: AppColors.black,
                                                  fontSize: 14,
                                                  fontFamily:
                                                      AppFonts.fontInterMedium,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: AppColors.appColor
                                                      .withOpacity(0.15),
                                                  border: Border.all(
                                                    color: AppColors.appColor,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                width: MediaQuery.of(context).size.width * 0.55,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Text(cartRepo.cartListData?[index].productType ?? '',
                                                      style: const TextStyle(
                                                          fontSize: 12,
                                                          color: AppColors
                                                              .appColor)),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.55,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Row(
                                                        children: [
                                                          Text(cartRepo.cartListData?[index].salePrice ?? '',
                                                            style:  TextStyle(
                                                              fontSize: 14,
                                                              decoration: cartRepo.cartListData?[index].isItemFree == "0" ? TextDecoration.none : TextDecoration.lineThrough,
                                                              decorationColor: cartRepo.cartListData?[index].isItemFree == "0" ? Colors.transparent : Colors.red,
                                                              fontFamily: AppFonts
                                                                  .fontInterMedium,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 4,
                                                          ),
                                                          Visibility(
                                                            visible: cartRepo.cartListData?[index].isItemFree == "1",
                                                            child: const Text("0.00 (Free)"),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Visibility(
                                                      visible: cartRepo.cartListData?[index].isItemFree == "0",
                                                      child: Container(
                                                        height:
                                                            MediaQuery.of(context).size.height * 0.035,
                                                        decoration: BoxDecoration(
                                                            color: AppColors.appColor,
                                                            borderRadius: BorderRadius.circular(5)),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            IconButton(
                                                                icon: const Icon(
                                                                  Icons.remove,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 12,
                                                                ),
                                                                onPressed: () {
                                                                  int addQuantity = int.parse(cartRepo.cartListData![index].qty ?? '');
                                                                  addQuantity--;
                                                                  if (addQuantity > 0) {
                                                                    setState(() {
                                                                      cartRepo.cartListData![index].qty = addQuantity.toString();
                                                                    });
                                                                  }
                                                                }
                                                                //decrementQuantity,
                                                                ),
                                                            Text(
                                                              cartRepo.cartListData?[index].qty ?? '',
                                                              style: const TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 11),
                                                            ),
                                                            IconButton(
                                                              icon: const Icon(
                                                                  Icons.add,
                                                                  color: Colors.white,
                                                                  size: 12),
                                                              onPressed: () {
                                                                int addQuantity = int.parse(cartRepo.cartListData![index].qty ?? '');addQuantity++;
                                                                setState(() {
                                                                  cartRepo.cartListData![index].qty = addQuantity.toString();
                                                                });

                                                              },

                                                              //incrementQuantity,
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
                                      )
                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible: index == cartListData!.length - 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 100, top: 15),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.08,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.add,
                                            size: 30,
                                            color: AppColors.appColor,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            AppStrings.textAddMoreItem,
                                            style: TextStyle(
                                              color: AppColors.appColor,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.020,
                                              fontFamily:
                                                  AppFonts.fontInterMedium,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          );
                        }),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.2,
                    ),
                    child: SvgPicture.asset(
                      ImageAssets.cartIcon,
                      height: MediaQuery.of(context).size.height * 0.12,
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.03,
                      ),
                      child: Text(AppStrings.textCartIsEmpty,
                          style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.032,
                            fontFamily: AppFonts.fontInterBold,
                          ))),
                  Container(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height * 0.02,
                        right: MediaQuery.of(context).size.height * 0.02,
                      ),
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.03,
                      ),
                      child: const Text(
                        textAlign: TextAlign.center,
                        AppStrings.textCartSubTitle,
                        style: TextStyle(
                          color: AppColors.grey,
                          fontSize: 16,
                          fontFamily: AppFonts.fontInterRegular,
                        ),
                      )),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.appColor,
                        borderRadius: BorderRadius.circular(5)),
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03,
                    ),
                    width: MediaQuery.of(context).size.height * 0.14,
                    height: MediaQuery.of(context).size.height * 0.04,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.appColor,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BottomSheetScreen(),
                            ));
                      },
                      child: const Text(
                        AppStrings.textShopNow,
                        style: TextStyle(
                            fontSize: 14, fontFamily: AppFonts.fontInterMedium),
                      ),
                    ),
                  )
                ],
              ),
        backgroundColor: Colors.grey.shade300,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            height: 50,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                backgroundColor: AppColors.appColor,
              ),
              onPressed: () {
                _showBottomSheet(context);
              },
              child: const Text(
                AppStrings.textGoToCheckOut,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: AppFonts.fontInterMedium,
                ),
              ),
            )),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    margin: const EdgeInsets.only(right: 20),
                    child: const Text(AppStrings.textCheckOut,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: AppFonts.fontInterBold,
                        )),
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade100,
                    ),
                    child: Center(
                      child: IconButton(
                        icon: const Icon(
                          Icons.close, // Use the close (or dismiss) icon
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          // Add your close icon's onPressed behavior here
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const CustomDivider(),
              const Visibility(
                visible: false,
                child: CustomContainer(
                  containerTextColor: AppColors.grey,
                  text: AppStrings.textDelivery,
                  isShowForwardArrow: true,
                  text2: 'Ahmedabad',
                ),
              ),
              const Visibility(visible: false, child: CustomDivider()),
              const CustomContainer(
                containerTextColor: AppColors.grey,
                text: AppStrings.textPayment,
                isShowForwardArrow: false,
                text2: AppStrings.textCashOnDelivery,
              ),
              const CustomDivider(),
              const Visibility(
                visible: false,
                child: CustomContainer(
                  containerTextColor: AppColors.grey,
                  text: AppStrings.textPromoCode,
                  isShowForwardArrow: true,
                  text2: AppStrings.textPickDiscount,
                ),
              ),
              const Visibility(visible: false, child: CustomDivider()),
              CustomContainer(
                  containerTextColor: AppColors.grey,
                  text: AppStrings.textTotalCost,
                  isShowForwardArrow: false,
                  text2: cartRepo.totalPriceOfCart),
              const CustomDivider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    AppStrings.textTermsAndConditions,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: AppFonts.fontInterRegular,
                    ),
                  ),
                ),
              ),
           //   isLoading ? const Center(child:  ProgressBarWithAppColor()) :
              Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      backgroundColor: AppColors.appColor,
                    ),
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      String storeId = SharedPrefManager.shared.sharedPres.getString("store Id") ?? '';

                      final message = await orderRepo.generatedOrder(
                          storeId, cartRepo.totalPriceOfCart);
                      setState(() {
                        isLoading = false;
                      });
                      if (message == "1") {
                        successSnackBar(AppStrings.theProductIsAddedToCart);
                        navigation();
                      } else {
                        /*SnackBar snackBar = SnackBar(
                          content: const Text(AppStrings.someThingWantWrong,
                              style: TextStyle(fontSize: 20)),
                          backgroundColor: Colors.red,
                          dismissDirection: DismissDirection.up,
                          behavior: SnackBarBehavior.floating,
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);*/

                       /* ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            margin: EdgeInsets.only(
                                bottom: MediaQuery.of(context).size.height - 100,
                                right: 20,
                                left: 20),
                            content: Text(message),
                            backgroundColor: AppColors.red,
                            duration: const Duration(seconds: 3), // Adjust the duration as needed
                          ),
                        );*/
                        errorSnackBar(AppStrings.someThingWentWrong);
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text(
                      AppStrings.textPlaceOrder,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppFonts.fontInterMedium,
                      ),
                    ),
                  )),
            ],
          ),
        );
      },
    );

  }
  void successSnackBar(String message) {
    ReusableSnackBar.show(context, message, isSuccess: true);
  }
  void errorSnackBar(String message) {
    ReusableSnackBar.show(context, message);
  }
  void navigation() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const OrderAcceptedScreen()),
    );
  }
}
