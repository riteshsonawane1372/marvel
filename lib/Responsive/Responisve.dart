import 'package:flutter/material.dart';



class Responsive extends StatelessWidget {

  final Widget MobileScreenlayout;
  final Widget WebScreenLayout;

  Responsive({
    required this.WebScreenLayout,
    required this.MobileScreenlayout
});
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,size){
        if(size.maxWidth>600) return WebScreenLayout;
        else return MobileScreenlayout;
    });
  }
}
