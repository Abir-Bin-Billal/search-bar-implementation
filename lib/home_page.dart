import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/products.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
final Dio _dio = Dio();
List<Product> _product = [];

@override
  void initState() {
    _loadData();
    super.initState();
  }
void _loadData({String? searchText}) async{
  String url = "https://freetestapi.com/api/v1/products";
  if(searchText != null){
    url += "?search=$searchText";
  }
      Response res = await _dio.get(url);
      List<Product> products = [];
      if(res.data != null){
        for(var p in res.data){
          products.add(Product.fromJson(p));
        }
      }
      setState(() {
        _product = products;
      });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Fcommerce"),
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI(){
    return SizedBox.expand(child: Column(
      children: [
        _searchBar(),
        if(_product.isNotEmpty) prouductsListView(),
        if(_product.isEmpty) Text("No data found")
      ],
    ),
    );
  }

  Widget prouductsListView(){
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.80,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: _product.length,
          itemBuilder: (context , index){
            Product product = _product[index];

            return ListTile(
              leading: Image.network(product.image),
              subtitle: Text("${product.brand} ~ \$${product.price.toString()}"),
              title: Text(product.name),
              trailing: Text("${product.rating.toString()}⭐"),
            );

          }),
    );
  }

  Widget _searchBar(){
  return SizedBox(
    width: MediaQuery.sizeOf(context).width*0.80,
    child: TextField(
      decoration: InputDecoration(
        hintText: "Search.....",
          border: OutlineInputBorder()
      ),
      onSubmitted: (value){
        _loadData(searchText: value);
      },
    ),
  );
  }
}