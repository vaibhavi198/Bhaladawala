import 'package:bhaladawala_app/model/category_data_model.dart';
import 'package:bhaladawala_app/repo/category_repo.dart';
import 'package:bhaladawala_app/screens/product_list/product_detail.dart';
import 'package:bhaladawala_app/screens/product_list/product_list.dart';
import 'package:bhaladawala_app/utils/app_colors.dart';
import 'package:bhaladawala_app/utils/app_routes_strings.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GridViewCategory extends StatefulWidget {
  List<CategoryDataModel> list;
   GridViewCategory({super.key, required this.list});

  @override
  State<GridViewCategory> createState() => _GridViewCategoryState();
}

class _GridViewCategoryState extends State<GridViewCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .3,
      color: AppColors.white,
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
             crossAxisSpacing: 0.4,
            childAspectRatio: 0.8,
            mainAxisSpacing: 0.3),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>  ProductListScreen(id : widget.list[index].id?.toString() ?? ""),
              ));
            },
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.09,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.all(2),
                  padding: const EdgeInsets.all(0.1),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20), // Adjust the value as needed
                    child: CachedNetworkImage(
                      imageUrl: widget.list[index].image ?? "",
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 0.07,
                    ),
                  ),
                ),
                Text(widget.list[index].category ??'',overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,)
              ],
            ),
          );
        },
        itemCount: widget.list.length,
      ),
    );
  }
}

