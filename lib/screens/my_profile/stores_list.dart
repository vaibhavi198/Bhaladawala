import 'package:bhaladawala_app/custom_class/custom_appbar.dart';
import 'package:bhaladawala_app/custom_class/custom_store_list.dart';
import 'package:bhaladawala_app/custom_class/progessbar_with_appcolor.dart';
import 'package:bhaladawala_app/repo/store_list_repo.dart';
import 'package:bhaladawala_app/screens/auth_screens/add_store_screen.dart';
import 'package:bhaladawala_app/utils/app_image_assets.dart';
import 'package:flutter/material.dart';

class StoreListsScreen extends StatefulWidget {
  const StoreListsScreen({super.key});

  @override
  State<StoreListsScreen> createState() => _StoreListsScreenState();
}

class _StoreListsScreenState extends State<StoreListsScreen> {
  bool isLoading = false;
  final storeListRepo = StoreListRepo();


  @override
  void initState() {
    super.initState();
    storeListData();
  }

  Future<void> storeListData() async {
    setState(() {
      isLoading = true;
    });
    await storeListRepo.storeList();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
            appBar: CustomAppBar(
              appBarText: 'Store List',
              appBarBackArrow: true,
              appBarImage: ImageAssets.addStoreIcon,
              height: 22,
              onPressedCallback: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddStoreScreen()));
              },
            ),
        body: isLoading ? const Center(child: ProgressBarWithAppColor()) :
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.89,
                child:  CustomStoreList(storeListRepo: storeListRepo,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
