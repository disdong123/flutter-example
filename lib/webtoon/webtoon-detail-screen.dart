import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hanflix/webtoon/service/api-service.dart';

class ToonDetailScreen extends StatefulWidget {
  const ToonDetailScreen({super.key, required this.toon});
  final WebtoonResponse toon;

  @override
  State<ToonDetailScreen> createState() => _ToonDetailScreenState();
}

class _ToonDetailScreenState extends State<ToonDetailScreen> {

  // 파라미터로 id 가 필요한데, 생성자를 통해 받아와야되어서 home-screen 에서 한것처럼 StatelessWidget 을 사용할 수 없습니다.
  // StatelessWidget 에서 Future<int> something = ApiService.getSomething(toon.id); 로 하면 toon 에 접근할 수 없습니다.
  // 따라서 StatefulWidget 을 사용해야합니다.
  late Future<int> something;

  @override
  void initState() {
    super.initState();
    something = ApiService.getSomething(widget.toon.id);
  }

  @override
  Widget build(BuildContext context) {
    // home-screen 에서 벗어나므로 Scaffold 가 필요합니다.
    return Scaffold(
      appBar: AppBar(
          elevation: 30,
          foregroundColor: Colors.green,
          backgroundColor: Colors.white,
          title: Text(widget.toon.title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
      ),
      body: Column(
          children: [
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: widget.toon.id,
                  child: Container(
                      width: 250,
                      clipBehavior: Clip.hardEdge,  // ??
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            )
                          ]
                      ),
                      child: Image.network(widget.toon.thumb, headers: const {"User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",})
                  ),
                ),
              ],
            ),
          ]
      )
    );
  }
}
