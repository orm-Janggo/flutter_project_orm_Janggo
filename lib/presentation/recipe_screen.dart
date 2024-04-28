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
    return Scaffold(
      appBar: AppBar(
        title: Text('레시피'),
      ),
      body: PageView(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.0),
                    margin: EdgeInsets.only(bottom: 16.0),
                    decoration: BoxDecoration(color: Colors.yellow),
                    child: FutureBuilder<PictureModel>(
                      future: viewModel.getPicture('사과'),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          final PictureModel picture = snapshot.data!;
                          return Image.network(
                            picture.url,
                          );
                        }
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Text(state.recipe),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
