import 'package:bhaladawala_app/repo/store_list_repo.dart';
import 'package:flutter/material.dart';

class CustomStoreList extends StatefulWidget {
  final  StoreListRepo storeListRepo ;



  const CustomStoreList({super.key, required this.storeListRepo,});

  @override
  State<CustomStoreList> createState() => _CustomStoreListState();
}

class _CustomStoreListState extends State<CustomStoreList> {
  int? selectedValue;



  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,  //light grey
      child: ListView.builder(
        itemCount: widget.storeListRepo.storeListData?.length,
        itemBuilder: (context, index) {
          print(widget.storeListRepo.storeListData?.length,);
          return Card(
            elevation: 5,
            color: Colors.white,  // white
            child: ListTile(
              leading: Radio<int>(
                value: index,
                groupValue: selectedValue,
                onChanged: (int? value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
                activeColor: Colors.black,
              ),

            title: Text(widget.storeListRepo.storeListData?[index].store ?? ""),
              subtitle: Text(widget.storeListRepo.storeListData?[index].storeAddress ?? ""),
              trailing: const Visibility(
                  visible: false,
                  child: Icon(Icons.edit)),
            ),
          );
        },
      ),
    );
  }
}
