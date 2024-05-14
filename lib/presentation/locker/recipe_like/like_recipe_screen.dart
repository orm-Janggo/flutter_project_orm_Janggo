import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/main.dart';
import 'package:flutter_project_orm_janggo/presentation/components/like_widget.dart';
import 'package:go_router/go_router.dart';

class LikeRecipeScreen extends StatefulWidget {
  const LikeRecipeScreen({super.key});

  @override
  State<LikeRecipeScreen> createState() => _LikeRecipeScreenState();
}

class _LikeRecipeScreenState extends State<LikeRecipeScreen> {
  @override
  Widget build(BuildContext context) {
    bool _isExpanded = false;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.orange,
      body: Stack(
        children: [
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
                    suffixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: likeBox.length,
                  itemBuilder: (context, index) {
                    final recipe = likeBox.getAt(index);
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: LikeWidget(recipe: recipe),
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
                backgroundColor: Color(0xFFFDBA66), // 타일의 배경색 설정
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 30),
                    Text(
                      "레시피 좋아요 보관함",
                      style: TextStyle(fontFamily: 'school_font'),
                    ),
                  ],
                ),
                children: [
                  InkWell(
                    onTap: () {
                      context.push('/main/recipe-history');
                    },
                    child: ListTile(
                      title: Center(
                        child: Text(
                          "레시피 히스토리 보관함",
                          style: TextStyle(fontFamily: 'school_font'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
