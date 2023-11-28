import 'package:bhaladawala_app/custom_class/custom_appbar.dart';
import 'package:bhaladawala_app/custom_class/progessbar_with_appcolor.dart';
import 'package:bhaladawala_app/model/home_model.dart';
import 'package:bhaladawala_app/repo/category_repo.dart';
import 'package:bhaladawala_app/screens/product_list/product_list.dart';
import 'package:bhaladawala_app/utils/app_colors.dart';
import 'package:bhaladawala_app/utils/app_fonts.dart';
import 'package:bhaladawala_app/utils/app_image_assets.dart';
import 'package:bhaladawala_app/utils/app_strings.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({
    super.key,
  });

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final categoryRepo = CategoryRepo();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getCategoryData();
  }

  void getCategoryData() async {
    setState(() {
      isLoading = true;
    });
    final String message = await categoryRepo.getCategoryList();
      setState(() {
        isLoading = false;
      });
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
          appBar: const CustomAppBar(
            appBarText: AppStrings.textShopByCategory,
          ),
          body: isLoading ? const Center(child: ProgressBarWithAppColor()) : Container(
            height: MediaQuery.of(context).size.height,
            color: AppColors.white,
            padding: const EdgeInsets.all(12.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 0.4,
                  childAspectRatio: 0.70,
                  mainAxisSpacing: 0.3),
              itemBuilder: (BuildContext context, int index) {

                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  ProductListScreen(id :categoryRepo.categoryList?[index].id.toString() ?? ''),
                    ));
                  },
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.13,
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                          color: AppColors.customGreen.withOpacity(0.10),
                          border: Border.all(
                            color: AppColors.customGreen.withOpacity(0.10),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: CachedNetworkImage(
                            imageUrl: categoryRepo.categoryList?[index].image ?? '',
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height * 0.1 ,
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.02),
                          child: Center(
                              child: Text(
                                  categoryRepo.categoryList?[index].category ??
                                      "",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.height *
                                        0.015,
                                    fontFamily: AppFonts.fontInterBold,
                                  ))))
                    ],
                  ),
                );
              },
              itemCount: categoryRepo.categoryList?.length,
            ),
          )),
    );
  }
}
