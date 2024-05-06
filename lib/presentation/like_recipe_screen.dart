import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/presentation/components/like_widget.dart';
import 'package:go_router/go_router.dart';

class LikeRecipeScreen extends StatefulWidget {
  const LikeRecipeScreen({super.key});

  @override
  State<LikeRecipeScreen> createState() => _LikeRecipeScreenState();
}

class _LikeRecipeScreenState extends State<LikeRecipeScreen> {
  bool _isExpanded = false; // ExpansionTile의 확장 상태를 제어하기 위한 변수

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded; // 클릭 시 확장 상태를 토글
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width; // 가로 길이

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.orange,
      body: Stack(children: [
        Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "좋아요 레시피 검색",
                    hintText: "레시피 이름 검색",
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.mic),
                    filled: true,
                    // 텍스트 필드 내부에 색상을 채웁니다
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    )),
              ),
            ),
            SizedBox(
              height: 750,
              width: double.infinity,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10, // 원하는 아이템 수
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: LikeWidget(),
                  );
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Positioned(
            top: 50,
            child: ExpansionTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center, // 가운데 정렬
                children: [
                  SizedBox(width: 30,),
                  Text("레시피 좋아요 보관함", style: TextStyle(fontFamily: 'school_font'),),
                ],
              ),
              children: [
                Container(
                  color: Colors.black, // 배경색 추가
                  child: ListTile(
                    title: Text("타일 1", style: TextStyle(fontFamily: 'school_font', color: Colors.white),),
                  ),
                ),
                Container(
                  color: Colors.black, // 배경색 추가
                  child: ListTile(
                    title: Text("타일 2", style: TextStyle(fontFamily: 'school_font', color: Colors.white),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
