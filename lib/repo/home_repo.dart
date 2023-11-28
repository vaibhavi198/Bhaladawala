import 'dart:convert';

import 'package:bhaladawala_app/Api/api_handler.dart';
import 'package:bhaladawala_app/model/category_data_model.dart';
import 'package:bhaladawala_app/model/home_model.dart';
import 'package:bhaladawala_app/shared_preference/shared_preference_manager.dart';
import 'package:bhaladawala_app/utils/app_strings.dart';

class HomeRepo{
  bool isLoading = false;
  List<Offer>? listOfOffers = [];
  List<CategoryDataModel>? listOfCategory = [];
  List<ExploreData>? listOfExplore = [];
  List<LimitDealData>? listOfLimitDeals = [];

  late APIHandler handler;
  HomeRepo(){
    handler = APIHandler();
  }

  Future<String> getHomeData() async{
    String endpoint = '/home';
    String message = '';
    var map = Map<String, dynamic>();
    print(SharedPrefManager.shared.sharedPres.getString(AppStrings.token));
    map['token'] = SharedPrefManager.shared.sharedPres.getString(AppStrings.token);

    var response = await handler.postRequest(endpoint,parameters: map);

    if(response.statusCode == 200){
      final Map<String,dynamic> data = json.decode(response.body);
      HomeModel homeModel = HomeModel.fromJson(data);
      message = homeModel.status.toString();
      listOfOffers?.addAll(homeModel.data?.offer ?? []);
      listOfCategory?.addAll(homeModel.data?.category ?? []);
      listOfExplore?.addAll(homeModel.data?.exploreData ?? []);
      listOfLimitDeals?.addAll(homeModel.data?.limitDealData ?? []);

      print(listOfLimitDeals?.length);


    }
    return message;
  }
}