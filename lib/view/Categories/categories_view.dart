import 'package:flutter/material.dart';

import 'widget/categories_widget.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Text("Salon for Women",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: ()=>BackButton(),
        ),
      ),
      body: CategoriesWidget(),
    );
  }
}
