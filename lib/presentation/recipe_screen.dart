import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project_orm_janggo/presentation/recipe_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../domain/model/picture_model.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({
    super.key,
    required this.ingredients,
  });

  final String ingredients;

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  // 현재 페이지의 index 추적
  final PageController _pageController = PageController();

  // 현재 페이지의 index
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    final ingredients = widget.ingredients;
    context.read<RecipeViewModel>().getRecipe(ingredients);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RecipeViewModel>();
    final state = viewModel.state;
    if (state.recipe != []) {
      viewModel.getPicture(state.recipe);
      setState(() {});
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          // 페이지 전체 개수와 현재 페이지 인덱스를 표시
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                state.recipe.isNotEmpty
                    ? '${_currentPage + 1} / ${state.recipe.length}'
                    : '',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(width: 150), // 공백 추가
            ],
          ),
          IconButton(
            onPressed: () {
              context.push('/main/my-page');
            },
            icon: Icon(Icons.face),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: SafeArea(
        child: state.recipe.isEmpty
            ? Center(
                child: Container(
                  width: 300,
                  height: 150,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/book.gif',
                        fit: BoxFit.fill,
                      ),
                      const Text('레시피를 찾고있어요 잠시만 기다려주세요!', style: TextStyle(fontFamily: 'school_font', fontSize: 15),),
                      const Text('Ai가 항상 정확하진 않아요..!', style: TextStyle(fontFamily: 'school_font', fontSize: 15),),
                    ],
                  ),
                ),
              )
            : Center(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      height: 4.0,
                      child: Center(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.recipe.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: MediaQuery.of(context).size.width / 3 - 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: _currentPage == index
                                    ? const Color(0xfffb8c00)
                                    : Colors.grey.shade200,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: PageView.builder(
                        itemCount:
                            state.recipe.length > 3 ? 3 : state.recipe.length,
                        controller: _pageController,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 265,
                                    width: 400,
                                    child: (state.url.isNotEmpty &&
                                            index < state.url.length &&
                                            state.url[index] != 'empty')
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 1,
                                                ),
                                              ),
                                              child: Image.network(
                                                state.url[index],
                                                height: 265,
                                                width: 400,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.white70,
                                                  width: 1,
                                                ),
                                              ),
                                              child: Image.asset(
                                                'assets/images/empty_image.png',
                                                height: 265,
                                                width: 400,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Scrollbar(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: Colors.amber[50],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(
                                          state.recipe[index],
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'hand_font',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
