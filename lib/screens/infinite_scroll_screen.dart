import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class InfiniteScrollScreen extends StatefulWidget {  
  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  final ScrollController controller = ScrollController();
  // final List<String> numbers = List.generate(25, (index) => 'File $index');
  List<String> numbers = [];
  bool isLoading = false;

  int page = 1;

  @override
  void initState() {
    super.initState();
    fetchData();
    controller.addListener(() {
        if (controller.position.maxScrollExtent == controller.offset) {
          fetchData();
        }
    });
  }


  fetchData() async {
    if (isLoading) return;
    isLoading = true;

    const int limit = 25;
    // final url = Uri.parse('https://jsonplaceholder.typicode.com/posts?=_limit$limit&_page$page');
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts?_limit=$limit&_page=$page');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List newItems = jsonDecode(response.body);
      setState(() {
        numbers.addAll(newItems.map((item){
            final number = item['id'];
            return 'Fila $number';
        }).toList());
        page++;
        isLoading = false;
      });
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          controller: controller,
          itemCount: numbers.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if ( index < numbers.length) {
                final item = numbers[index];
                return ItemBloque(title: item);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
     ),
   );
  }
}

class ItemBloque extends StatelessWidget {
  final String title;
  ItemBloque({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(title),
    );
  }
}