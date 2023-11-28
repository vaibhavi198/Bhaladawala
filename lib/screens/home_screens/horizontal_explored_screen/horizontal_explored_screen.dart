import 'package:bhaladawala_app/model/home_model.dart';
import 'package:bhaladawala_app/utils/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ExploredCarouselSlider extends StatefulWidget {
  List<ExploreData> list;

  ExploredCarouselSlider({super.key, required this.list});

  @override
  State<ExploredCarouselSlider> createState() => _State();
}

class _State extends State<ExploredCarouselSlider> {
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.23,
      child: PageView.builder(
        itemCount: widget.list.length,
        controller: PageController(
            initialPage: 0, keepPage: true, viewportFraction: 0.8),
        itemBuilder: (BuildContext context, int itemIndex) {
          return buildImage(
              widget.list[itemIndex].images?[itemIndex] ?? '', itemIndex);
        },
      ),
    );
  }

  Widget buildImage(String urlImage, int index) => Stack(children: [
        Container(
          margin:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.03),
          decoration: BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.circular(20),
          ),
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              imageUrl: urlImage,
            ),
          ),
        ),
      ]);
}
