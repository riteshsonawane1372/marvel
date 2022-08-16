import 'package:flutter/material.dart';
import 'package:marvel/Data/network.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvel/Screens/Details_files.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  final scrollController = ScrollController();

  List Data =[];
  bool _isloading = true;

  @override
  void initState() {
    // TODO: implement initState
    DataFecthed();
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent==scrollController.offset){ // Check if we have reached the last end
        DataFecthed();
      }
    });
  }

  void DataFecthed() async{
    setState(() {
      _isloading=true;
    });
    var res =await ApiData().getData();
    setState(() {
      Data=res;
      _isloading=false;
    });
    print(Data[0]["title"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isloading?Center(child: SpinKitWanderingCubes(
        color: Colors.white,
        size: 50.0,
      ),): Column(
        children: [
          Expanded(
            child: GridView.builder(
              controller: scrollController,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio:0.5
                ),
                itemCount: Data.length,
              itemBuilder: (context,index){
                  if (index< Data.length){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context)=>DetailsScreen(
                                      title:Data[index]['title'],
                                      url: Data[index]['cover_url'],
                                  )
                              ));
                        },
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
                      ),
                    );
                  }
                  else{
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SpinKitSpinningLines(color: Colors.white),
                    );
                    
                  }
                  
              },
            ),
          ),

        ],
      )
    );
  }
}
