import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/presentation/locker/recipe_history/recipe_history/recipe_history_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RecipeHistoryScreen extends StatefulWidget {
  const RecipeHistoryScreen({super.key});

  @override
  State<RecipeHistoryScreen> createState() => _RecipeHistoryScreenState();
}

class _RecipeHistoryScreenState extends State<RecipeHistoryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<RecipeHistoryViewModel>().getDataListFromHive();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RecipeHistoryViewModel>();
    final state = viewModel.state;

    // 스크린의 가로화면 사이즈
    final screenWidth = MediaQuery.of(context).size.width;
    // 스크린의 세로화면 사이즈
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          state.recipe.isNotEmpty
              ? Container(
                  padding: EdgeInsets.fromLTRB(screenWidth * 0.05,
                      screenHeight * 0.11, screenWidth * 0.05, 0),
                  decoration: const BoxDecoration(
                    color: Color(0xffFB8C00),
                  ),
                  child: ListView.builder(
                    itemCount: state.recipe.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          context.push(
                            '/main/recipe-history-detail',
                            extra: state.id[index],
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: screenHeight * 0.01),
                          padding: EdgeInsets.all(screenWidth * 0.03),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: screenWidth * 0.3,
                                child: state.url[index] != 'empty'
                                    ? ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(state.url[index]),
                                      )
                                    : ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                            'assets/images/empty_image.png'),
                                      ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: screenWidth * 0.03),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              8.0, 2.0, 8.0, 0),
                                          decoration: BoxDecoration(
                                            color: const Color(0xffFB8C00),
                                            borderRadius:
                                                BorderRadius.circular(48.0),
                                          ),
                                          child: Text(
                                            viewModel.dateText(
                                                state.searchDate[index]),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: screenHeight * 0.02,
                                      ),
                                      Text(
                                        state.recipe[index],
                                        overflow: TextOverflow.clip,
                                        softWrap: true,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  viewModel.deleteDataFromHive(state.id[index]);
                                  setState(() {
                                    viewModel.getDataListFromHive();
                                  });
                                },
                                icon: const Icon(Icons.close),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Container(
                  height: screenHeight * 0.11,
                  decoration: const BoxDecoration(
                    color: Color(0xffFB8C00),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: Text('값이 없습니다!'),
                    ),
                  ),
                ),
          Container(
            padding: const EdgeInsets.only(top: 40),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xffFB8C00),
              ),
              child: ExpansionTile(
                backgroundColor: const Color(0xFFFDBA66), // 타일의 배경색 설정
                title: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 30),
                    Text(
                      "레시피 히스토리 보관함",
                      style: TextStyle(
                        fontFamily: 'school_font',
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      context.push('/main/recipe-like');
                    },
                    child: const ListTile(
                      title: Center(
                        child: Text(
                          "레시피 좋아요 보관함",
                          style: TextStyle(
                            fontFamily: 'school_font',
                            fontSize: 18.0,
                          ),
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
