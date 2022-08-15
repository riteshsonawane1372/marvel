import 'package:flutter/material.dart';
import 'package:marvel/Data/network.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  List Data =[];

  @override
  void initState() {
    // TODO: implement initState
    DataFecthed();
    super.initState();
  }

  void DataFecthed() async{
    var res =await ApiData().getData();
    setState(() {
      Data=res;
    });
    print(Data[0]["title"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio:0.5
                ),
                itemCount: Data.length,
              itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: NetworkImage(Data[index]['cover_url']),
                            fit: BoxFit.fill
                          )
                      ),
                      child: null,
                    ),
                  );
              },
            ),
          ),

        ],
      )
    );
  }
}
