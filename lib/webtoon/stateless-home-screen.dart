import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hanflix/webtoon/service/api-service.dart';
import 'package:hanflix/webtoon/webtoon-detail-screen.dart';

/**
 * FutureBuilder 를 이용하면 StatelessWidget 에서도 비동기 처리를 할 수 있습니다.
 */
class StatelessHomeScreen extends StatelessWidget {
  StatelessHomeScreen({super.key});

  final Future<List<WebtoonResponse>> toons = ApiService.getTodayWebtoons();

  @override
  Widget build(BuildContext context) {
    // print(toons);
    return Scaffold(
      appBar: AppBar(
        elevation: 30,
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        title: Text('Webtoon!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
      ),
      body: FutureBuilder(
        future: toons,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return Column(
              children: [
                SizedBox(height: 50,),
                Expanded(child: ToonListView(toons: snapshot.data!))
              ]
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      ),
    );
  }
}

class ToonListView extends StatelessWidget {
  const ToonListView({super.key, required this.toons});
  final List<WebtoonResponse> toons;

  @override
  Widget build(BuildContext context) {
    // ListView.builder 는 필요할 때 요소를 그립니다.
    // ListView.separated 는 요소 사이에 구분선을 넣을 수 있습니다.
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: toons.length,
      itemBuilder: (context, index) {
        var toon = toons[index];
        return ToonItem(toon: toon);
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: 10,);
      },
    );
  }
}

class ToonItem extends StatelessWidget {
  const ToonItem({super.key, required this.toon});
  final WebtoonResponse toon;

  @override
  Widget build(BuildContext context) {
    // 제스쳐를 감지합니다.
    return GestureDetector(
      onTap: () {
        // Navigator 를 이용하면 화면을 이동할 때 에니메이션이 있어서 화면이 이동된다는걸 느낄 수 있습니다.
        // MaterialPageRoute 은 Widget 을 감쌉니다.
        Navigator.push(context, MaterialPageRoute(builder: (context) => ToonDetailScreen(toon: toon), fullscreenDialog: true));
      },
      child: Column(
        children: [
          // 화면이 이동할 때 같은 tag 를 가진 Hero 로 이동하여 더 자연스럽게 느껴집니다.
          Hero(
            tag: toon.id,
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
                child: Image.network(toon.thumb, headers: const {"User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",})
            ),
          ),
          SizedBox(height: 10),
          Text(toon.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),)
        ],
      ),
    );
  }
}
