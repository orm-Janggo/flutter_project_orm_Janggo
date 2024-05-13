import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/presentation/locker/recipe_history/recipe_history_detail/recipe_history_detail_view_model.dart';
import 'package:flutter_project_orm_janggo/presentation/locker/recipe_history/recipe_history_view_model.dart';
import 'package:provider/provider.dart';

class RecipeHistoryDetailScreen extends StatefulWidget {
  final int id;

  const RecipeHistoryDetailScreen({
    super.key,
    required this.id,
  });

  @override
  State<RecipeHistoryDetailScreen> createState() =>
      _RecipeHistoryDetailScreenState();
}

class _RecipeHistoryDetailScreenState extends State<RecipeHistoryDetailScreen> {

  @override
  void initState() {
    super.initState();
    context.read<RecipeHistoryDetailViewModel>().getDetailDataListFromHive(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RecipeHistoryDetailViewModel>();
    final state = viewModel.state;

    // 스크린의 가로화면 사이즈
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 265,
              width: 400,
              child: state.url != 'empty' ? ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white70,
                      width: 1,
                    ),
                  ),
                  child: Image.network(
                    state.url[0],
                    height: 265,
                    width: 400,
                    fit: BoxFit.cover,
                  ),
                ),
              ) : ClipRRect(
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
            child: Scrollbar(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: Colors.amber[50],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    state.recipe[0],
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
  }
}
