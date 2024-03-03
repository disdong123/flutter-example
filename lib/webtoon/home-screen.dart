import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hanflix/webtoon/service/api-service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<WebtoonResponse> webtoons = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getTodayWebtoons();
  }

  getTodayWebtoons() async {
    webtoons = await ApiService.getTodayWebtoons();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 30,
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        title: Text('Webtoon!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
      ),
    );
  }
}
