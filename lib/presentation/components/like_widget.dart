import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/data/db/like_hive/like_item.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../locker/recipe_like/like_recipe_detail_screen.dart';


class LikeWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final LikeItem? recipe;

  const LikeWidget({
    this.onTap,
    this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go('/main/recipe/recipe-like/recipe-like-detail', extra: recipe);
      },
      child: SizedBox(
        width: 500,
        height: 450,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    if (recipe?.imageUrl != null && recipe!.imageUrl.isNotEmpty && recipe!.imageUrl != 'empty')
                      Image.network(
                        recipe!.imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      )
                    else
                      Image.asset(
                        "assets/images/empty_image.png",
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // 테두리 안쪽 배경색
                          border: Border.all(
                            color: Colors.black, // 테두리 색상
                            width: 2, // 테두리 두께
                          ),
                          borderRadius: BorderRadius.circular(8), // 테두리의 둥근 모서리 반경
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0), // 테두리 안쪽의 패딩
                          child: GestureDetector(
                            onTap: onTap,
                            child: Icon(
                              Icons.close,
                              color: Colors.black, // 아이콘의 색상 설정
                              size: 24, // 아이콘의 크기 설정
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                DateFormat('MM/dd HH:mm').format(recipe!.time),
                                style: TextStyle(fontSize: 15, fontFamily: 'school_font'),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        recipe!.foodName,
                        style: TextStyle(fontSize: 30, fontFamily: 'school_font'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
