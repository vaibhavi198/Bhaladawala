import 'package:bhaladawala_app/custom_class/custom_appbar.dart';
import 'package:bhaladawala_app/custom_class/custom_divider.dart';
import 'package:bhaladawala_app/custom_class/progessbar_with_appcolor.dart';
import 'package:bhaladawala_app/custom_class/snack_bar.dart';
import 'package:bhaladawala_app/repo/product_repo.dart';
import 'package:bhaladawala_app/utils/app_colors.dart';
import 'package:bhaladawala_app/utils/app_fonts.dart';
import 'package:bhaladawala_app/utils/app_strings.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'cart_repo.dart';

class MyCartTrial extends StatefulWidget {
  final String id;

  const MyCartTrial({super.key, required this.id});

  @override
  State<MyCartTrial> createState() => _MyCartTrialState();
}

class _MyCartTrialState extends State<MyCartTrial> {
  final detailsRepo = ProductRepo();
  final cartRepoTrial = AddCartRepoTrial();
  bool isLoading = false;
  int currentIndex = 0;
  String selectedValue = AppStrings.unit;
  CarouselController carouselController = CarouselController();

  @override
  void initState() {
    // fTODO: implement initState
    super.initState();
    getProductDetail();
  }

  getProductDetail() async {
    setState(() {
      isLoading = true;
    });
    await detailsRepo.getProductDetail(widget.id);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          appBarText: '',
          appBarBackArrow: true,
        ),
        body: isLoading
            ? const Center(child: ProgressBarWithAppColor())
            : SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey.shade300,
                  child: CarouselSlider(
                    carouselController: carouselController,
                    options: CarouselOptions(
                      scrollPhysics: const BouncingScrollPhysics(),
                      onPageChanged: (index, reason) {
                        if (kDebugMode) {
                          print("index::$index");
                          print("reason::$reason");
                        }
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      height: MediaQuery.of(context).size.height * 0.3,
                      viewportFraction: 1,
                      autoPlay: true,
                      aspectRatio: 2,
                    ),
                    items: itemList(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.25,
                    left: MediaQuery.of(context).size.height * 0.22,
                  ),
                  child: AnimatedSmoothIndicator(
                    activeIndex: currentIndex,
                    count:
                    detailsRepo.productDetails?.images?.length ?? 0,
                    effect: const WormEffect(
                        spacing: 10,
                        dotWidth: 9,
                        dotHeight: 9,
                        strokeWidth: 1,
                        dotColor: Colors.grey,
                        activeDotColor: AppColors.appColor,
                        paintStyle: PaintingStyle.fill),
                  ),
                )
              ]),
              Row(
                children: [
                  Row(
                    children: [
                      Radio<String>(
                        value: AppStrings.unit,
                        groupValue: selectedValue,
                        activeColor: Colors.black,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value!;
                          });
                        },
                      ),
                      const Text(AppStrings.unit),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<String>(
                        value: AppStrings.quantity,
                        groupValue: selectedValue,
                        activeColor: Colors.black,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value!;
                          });
                        },
                      ),
                      const Text(AppStrings.quantity),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.03,
                  right: MediaQuery.of(context).size.width * 0.03,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          detailsRepo.productDetails?.name ?? '',
                          style: const TextStyle(
                            color: AppColors.black,
                            fontSize: 18,
                            fontFamily: AppFonts.fontInterBold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width *
                                  0.01),
                          child: Text(
                            "${detailsRepo.productDetails?.unitQty} Unit, Price",
                            style: const TextStyle(
                              color: AppColors.grey,
                              fontSize: 16,
                              fontFamily: AppFonts.fontInterRegular,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.25),
                      child: Text(
                        detailsRepo.productDetails?.quantitySalePrice ??
                            '',
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: AppFonts.fontInterMedium,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomDivider(),
              ),
              ExpansionTile(
                collapsedTextColor: AppColors.black,
                collapsedIconColor: AppColors.black,
                textColor: AppColors.black,
                initiallyExpanded: false,
                iconColor: AppColors.black,
                backgroundColor: AppColors.white,
                title: const Text(
                    AppStrings.textProductDetail
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15, bottom: 8),
                    child: Text(
                      detailsRepo.productDetails?.description ?? '',
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomDivider(),
              ),
              Container(
                margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.56),
                child: const Text(
                  AppStrings.textSimilarProducts,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 18,
                    fontFamily: AppFonts.fontInterBold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.02),
                height: MediaQuery.of(context).size.height * 0.3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: detailsRepo.productDetails?.relatedProducts?.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyCartTrial(
                                  id: detailsRepo.productDetails
                                      ?.relatedProducts?[index].id
                                      .toString() ??
                                      '',
                                )),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(children: [
                              Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.2),
                                    borderRadius:
                                    BorderRadius.circular(10),
                                  ),
                                  width:
                                  MediaQuery.of(context).size.width *
                                      0.28,
                                  height:
                                  MediaQuery.of(context).size.height *
                                      0.12,
                                  margin: const EdgeInsets.all(3),
                                  child: ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          0.28,
                                      height: MediaQuery.of(context)
                                          .size
                                          .height *
                                          0.12,
                                      imageUrl: detailsRepo
                                          .productDetails
                                          ?.relatedProducts?[index]
                                          .image ??
                                          '',
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                            ]),
                            Container(
                                margin: const EdgeInsets.all(5),
                                child: Text(
                                  detailsRepo.productDetails?.relatedProducts?[index].name ?? '',
                                  style: const TextStyle(

                                    fontSize: 14,
                                    fontFamily: AppFonts.fontInterBold,
                                  ),
                                ))
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
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
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });

                final message = await cartRepoTrial.addToCartTrial(
                    detailsRepo.productDetails?.id.toString() ?? '',
                    selectedValue,
                    selectedValue == AppStrings.unit
                        ? detailsRepo.productDetails?.unitQty ?? ''
                        : detailsRepo.productDetails?.quantityQty ?? '',
                    selectedValue == AppStrings.unit
                        ? detailsRepo.productDetails?.unitRegularPrice ?? ''
                        : detailsRepo.productDetails?.quantityRegularPrice ??
                        '',
                    selectedValue == AppStrings.unit
                        ? detailsRepo.productDetails?.unitSalePrice ?? ''
                        : detailsRepo.productDetails?.quantitySalePrice ?? '');

                setState(() {
                  isLoading = false;
                });
                if (message == '1') {
                  successSnackBar(AppStrings.theProductIsAddedToCart);
                } else {
                  errorSnackBar(message);
                }
              },
              child: const Text(
                AppStrings.textAddToBasket,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: AppFonts.fontInterMedium,
                ),
              ),
            )),
        backgroundColor: AppColors.customBackground,
      ),
    );

  }

  List<Stack>? itemList() {
    return detailsRepo.productDetails?.images?.map((imagePath) {
      return Stack(
        children: [
          Builder(
            builder: (BuildContext context) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: imagePath,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              );
            },
          ),
        ],
      );
    }).toList();
  }


  void  successSnackBar(String message) {
    ReusableSnackBar.show(context, message,
        isSuccess: true);
  }

  void errorSnackBar(String message) {
    ReusableSnackBar.show(context, message);
  }
}
