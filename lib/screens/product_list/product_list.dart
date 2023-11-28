import 'package:bhaladawala_app/custom_class/custom_appbar.dart';
import 'package:bhaladawala_app/custom_class/progessbar_with_appcolor.dart';
import 'package:bhaladawala_app/repo/cart_repo.dart';
import 'package:bhaladawala_app/repo/product_repo.dart';
import 'package:bhaladawala_app/screens/home_screens/bottom_sheet.dart';
import 'package:bhaladawala_app/utils/app_colors.dart';
import 'package:bhaladawala_app/utils/app_fonts.dart';
import 'package:bhaladawala_app/utils/app_image_assets.dart';
import 'package:bhaladawala_app/utils/app_strings.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductListScreen extends StatefulWidget {
  final String id;

  const ProductListScreen({super.key, required this.id});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final repo = ProductRepo();
  final cartRepo = AddCartRepo();
  bool isLoading = false;
  String selectedValue = AppStrings.unit;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    getProductData();
  }

  void getProductData() async {
    setState(() {
      isLoading = true;
    });
    await repo.getProductList(widget.id);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          appBarText: 'Products',
          appBarImage: ImageAssets.cartAppBarIcon,
          appBarBackArrow: true,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const BottomSheetScreen()));
          },
          isCustomOnTap: true,
          onPressedCallback: () {
            // Navigator.of(context).pop();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const BottomSheetScreen()));
          },
        ),
        body: isLoading
            ? const Center(child: ProgressBarWithAppColor())
            : ListView.builder(
                itemCount: repo.productList?.length,
                itemBuilder: (BuildContext context, int index) {
                  var product = repo.productList?[index];

                  return Stack(children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.01),
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
                        // color: Colors.grey.shade300,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05,
                        left: MediaQuery.of(context).size.height * 0.04,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: CachedNetworkImage(
                          imageUrl: repo.productList?[index].image ?? '',
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height * 0.20,
                          width: MediaQuery.of(context).size.height * 0.41,
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.26,
                          left: MediaQuery.of(context).size.height * 0.045,
                        ),
                        child: Text(
                          repo.productList?[index].name ?? '',
                          style: const TextStyle(
                            color: AppColors.black,
                            fontSize: 16,
                            fontFamily: AppFonts.fontInterMedium,
                          ),
                        )),
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.3,
                        left: MediaQuery.of(context).size.width * 0.085,
                        right: MediaQuery.of(context).size.width * 0.045,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          repo.productList?[index].isUnitSelected = false;
                                        });
                                      },
                                      child: Image.asset(
                                        repo.productList?[index].isUnitSelected == false
                                            ? ImageAssets.selectedImage
                                            : ImageAssets.unSelectedImage,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Text(
                                        textAlign: TextAlign.center,
                                        AppStrings.quantity,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: repo.productList?[index].isUnitSelected == false
                                                ? AppColors.white
                                                : AppColors.appColor,
                                            fontFamily:
                                                AppFonts.fontInterBold)),
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          repo.productList?[index].isUnitSelected = true;
                                        });
                                        print(repo.productList?[index].isUnitSelected);
                                      },
                                      child: Image.asset(
                                        repo.productList?[index].isUnitSelected == true
                                            ? ImageAssets.selectedImage
                                            : ImageAssets.unSelectedImage,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Text(
                                        textAlign: TextAlign.center,
                                        AppStrings.unit,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: repo.productList?[index].isUnitSelected == true
                                                ? AppColors.white
                                                : AppColors.appColor,
                                            fontFamily:
                                                AppFonts.fontInterBold)),
                                  ],
                                ),

                                /* SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedIndex = 1;
                                // isButton2Pressed = !isButton2Pressed;
                                // isButton1Pressed = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: selectedIndex == 1 ? AppColors.appColor : AppColors.appColor.withOpacity(0.15),
                            ),
                            // ButtonStyle(
                            //   // backgroundColor: MaterialStateProperty
                            //   //     .resolveWith<Color>(
                            //   //       (Set<MaterialState> states) {
                            //   //     if (isButton2Pressed) {
                            //   //       return AppColors.appColor;// Color when pressed
                            //   //     }
                            //   //     return AppColors.appColor.withOpacity(0.15); // Default color
                            //   //   },
                            //   // ),
                            //
                            // ),
                            child: const Text(AppStrings.quantity)),
                      ),*/
                                /*   Container(
                        decoration: BoxDecoration(
                          color: isQuantitySelected == isQuantitySelected ? AppColors.appColor.withOpacity(0.15) : AppColors.appColor,
                          border: Border.all(color: AppColors.appColor.withOpacity(0.30), width: 1,),
                          borderRadius:
                          BorderRadius.circular(5),
                        ),
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: const Padding(
                          padding:
                          EdgeInsets.only(left: 30, top: 10, bottom: 10),
                          child: Text('Quantity',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: AppColors.appColor,
                              fontFamily: AppFonts.fontInterBold)),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isQuantitySelected = !isQuantitySelected;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isQuantitySelected == !isQuantitySelected ?  AppColors.appColor.withOpacity(0.15) :  AppColors.appColor,
                            border: Border.all(
                              color: AppColors.appColor,
                              width: 1,
                            ),
                            borderRadius:
                            BorderRadius.circular(5),
                          ),
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: const Padding(
                            padding:
                            EdgeInsets.only(left: 45, top: 10, bottom: 10),
                            child: Text('Unit',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.white,
                                    fontFamily: AppFonts.fontInterMedium)),
                          ),
                        ),
                      ),*/
                                // SizedBox(
                                //     width: MediaQuery.of(context).size.width * 0.25,
                                //     child: CustomElevatedButton(
                                //       text: repo.productList?[index].unitQty ??'',
                                //       onPressed: () {},
                                //       buttonColor: AppColors.appColor,
                                //       colorText: AppColors.white,
                                //     )
                                // ),
                              ],
                            ),
                            InkWell(
                              onTap: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                await cartRepo.addToCart(
                                  repo.productList?[index].id.toString() ?? '',
                                  '1',
                                  repo.productList?[index].unitQty.toString() ??
                                      '',
                                  repo.productList?[index].unitRegularPrice
                                          .toString() ??
                                      '',
                                  repo.productList?[index].unitSalePrice
                                          .toString() ??
                                      '',
                                );
                                setState(() {
                                  isLoading = false;
                                });

                                //Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddCartScreen(productList: repo.productList![index],),));
                              },
                              child: SvgPicture.asset(
                                ImageAssets.buyImage,
                                height: 100,
                              ),
                            ),
                          ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.450,
                        left: MediaQuery.of(context).size.height * 0.045,
                        //    bottom: MediaQuery.of(context).size.height * 0.045,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  repo.productList?[index].quantitySalePrice ??
                                      '',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontFamily: AppFonts.fontInterMedium,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Text(
                                  repo.productList?[index]
                                          .quantityRegularPrice ??
                                      '',
                                  style: const TextStyle(
                                      color: AppColors.grey,
                                      fontSize: 16,
                                      decoration: TextDecoration.lineThrough),
                                ),
                              ],
                            ),
                            Text(
                              textAlign: TextAlign.justify,
                              repo.productList?[index].description ?? '',
                              maxLines: 2,
                              style: const TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 14,
                                  fontFamily: AppFonts.fontInterMedium,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]);
                },
              ),
        backgroundColor: Colors.grey.shade200,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        /* floatingActionButton: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            height: 50,
            margin: const EdgeInsets.all(10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                backgroundColor: AppColors.appColor,
              ),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const AddCartScreen()),
                // );
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '2 Items',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: AppFonts.fontInterMedium,
                    ),
                  ),
                  VerticalDivider(
                    color: AppColors.white,
                    thickness: 1,
                    width: 15,
                    endIndent: 12.0,
                    indent: 12.0,
                  ),
                  Text(
                    '₹399.00',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: AppFonts.fontInterMedium,
                    ),
                  ),
                ],
              ),
            )),*/
      ),
    );
  }
}
