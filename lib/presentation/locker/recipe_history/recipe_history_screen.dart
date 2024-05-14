import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/presentation/locker/recipe_history/recipe_history_view_model.dart';
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
      appBar: AppBar(
        backgroundColor: const Color(0xffFB8C00),
        actions: [
          IconButton(
            onPressed: () async {
              await viewModel.deleteAllDataFromBox();
              await viewModel.getDataListFromHive();
              setState(() {});
            },
            icon: const Icon(Icons.delete_outline),
          ),
        ],
      ),
      body: state.recipe.isNotEmpty
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              color: const Color(0xffFB8C00),
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
                      margin:
                          EdgeInsets.symmetric(vertical: screenHeight * 0.01),
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
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(state.url[index]),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                        'assets/images/empty_image.png'),
                                  ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
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
                                        viewModel.searchDateText(
                                            state.searchDate[index]),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.02,
                                  ),
                                  SizedBox(
                                    child: Text(
                                      state.recipe[index],
                                      overflow: TextOverflow.clip,
                                      softWrap: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  viewModel.deleteDataFromHive(state.id[index]);
                                  setState(() {
                                    viewModel.getDataListFromHive();
                                  });
                                },
                                icon: const Icon(Icons.delete_outline),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon:
                                    const Icon(Icons.favorite_border_outlined),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          : const Center(
              child: Text('값이 없습니다!'),
            ),
    );
  }
}
