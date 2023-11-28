import 'package:bhaladawala_app/model/home_model.dart';
import 'package:bhaladawala_app/repo/home_repo.dart';
import 'package:bhaladawala_app/utils/app_colors.dart';
import 'package:bhaladawala_app/utils/app_fonts.dart';
import 'package:bhaladawala_app/utils/app_strings.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselContainer extends StatefulWidget {
  List<Offer>? listOfOffers;

  CarouselContainer({super.key, required this.listOfOffers});

  @override
  State<CarouselContainer> createState() => _CarouselContainerState();
}

class _CarouselContainerState extends State<CarouselContainer> {
  final homeRepo = HomeRepo();
  int currentIndex = 0;
  List<Offer>? listOfOffersData;
  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: MediaQuery.of(context).size.width * 0.9, // Adjust width as needed
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0), // Adjust the border radius
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          // Match the container's border radius
          child: CarouselSlider(
            carouselController: carouselController,
            options: CarouselOptions(
              scrollPhysics: const BouncingScrollPhysics(),
              onPageChanged: (index, reason) {
                // print("currentIndex is ${index}");
                setState(() {
                  currentIndex = index;
                });
                // print("currentIndex is ${currentIndex}");
              },
              height: MediaQuery.of(context).size.height * 0.3,
              autoPlay: widget.listOfOffers?.length != 1 ? true : false,
              aspectRatio: 2,
              viewportFraction: 1
            ),
            items: ItemList(),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.27,
          left: MediaQuery.of(context).size.height * 0.18,
        ),
        child:
        AnimatedSmoothIndicator(
          activeIndex: currentIndex,
          count: widget.listOfOffers?.length ?? 0,
          effect: const WormEffect(
              spacing: 10,
              dotWidth: 9,
              dotHeight: 9,
              strokeWidth: 1,
              dotColor: Colors.grey,
              activeDotColor: Colors.red,
              paintStyle: PaintingStyle.fill),
        ),
      )
    ]);
  }

  List<Widget>? ItemList() {
    return widget.listOfOffers?.map((imagePath) {
            return Stack(
              children: [
                   SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                   // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    child:
                    CachedNetworkImage(
                      // color: AppColors.black.withOpacity(0.01),
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width,
                      imageUrl: imagePath.image ?? "",
                      fit: BoxFit.cover,

                    ),
                  ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black.withOpacity(0.09),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only( left: MediaQuery.of(context).size.height * 0.01,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.04,
                          width: MediaQuery.of(context).size.width * 0.3,
                          margin: EdgeInsets.only(bottom:  MediaQuery.of(context).size.height * 0.01,),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                              child: Text(AppStrings.sliderEndYearSale,
                                  style: TextStyle(
                                      fontSize: 13.5,
                                      fontFamily: AppFonts.fontInterBold,
                                      color: AppColors.black))),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(widget.listOfOffers?[currentIndex].offerTitle?.toUpperCase() ?? "",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: AppFonts.fontInterBold,
                                    color: AppColors.black
                                  )),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.03,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),

                              child: Text(widget.listOfOffers?[currentIndex].offerText ?? "",
                                  style: const TextStyle(
                                    color: AppColors.black,
                                    fontSize: 14,
                                    fontFamily: AppFonts.fontInterBold,
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }).toList();
  }
}
