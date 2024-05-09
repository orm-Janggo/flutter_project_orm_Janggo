import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/data/db/like_hive/like_item.dart';

class LikeWidget extends StatelessWidget {
  final LikeItem? recipe;

  const LikeWidget({
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 450,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  recipe?.imageUrl != null
                  ? Image.network(recipe!.imageUrl, fit: BoxFit.cover,width: double.infinity,)
                  :Image.asset(
                    "assets/images/empty_image.png",
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
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
                        child: Text(
                          '10min',
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'school_font',
                            color: Colors.black, // 텍스트 색상
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.orange, // 테두리 안쪽 배경색
                            border: Border.all(
                              color: Colors.black, // 테두리 색상
                              width: 2, // 테두리 두께
                            ),
                            borderRadius: BorderRadius.circular(8), // 테두리의 둥근 모서리 반경
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0), // 테두리 안쪽의 패딩
                            child: Text(
                              '#From Chef',
                              style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'school_font',
                                color: Colors.black, // 텍스트 색상
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.orange, // 테두리 안쪽 배경색
                            border: Border.all(
                              color: Colors.black, // 테두리 색상
                              width: 2, // 테두리 두께
                            ),
                            borderRadius: BorderRadius.circular(8), // 테두리의 둥근 모서리 반경
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0), // 테두리 안쪽의 패딩
                            child: Text(
                              '#Challenge',
                              style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'school_font',
                                color: Colors.black, // 텍스트 색상
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Gilled Cheese and tomato Sandwich',
                      style: TextStyle(fontSize: 25, fontFamily: 'school_font'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('John Li', style: TextStyle(fontSize: 15, fontFamily: 'school_font'),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ImageIcon(
                          AssetImage('assets/images/heart.png'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}
