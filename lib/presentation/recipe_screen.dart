import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project_orm_janggo/data/data_source/picture_data_source.dart';
import 'package:flutter_project_orm_janggo/data/repository/picture_repository_impl.dart';
import 'package:flutter_project_orm_janggo/domain/model/picture_model.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/get_picture_use_case.dart';
import 'package:flutter_project_orm_janggo/presentation/recipe_view_model.dart';

class RecipeScreen extends StatefulWidget {

  const RecipeScreen({super.key,});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {

  final RecipeViewModel _viewModel = RecipeViewModel(getPictureUseCase: GetPictureUseCase(PictureRepositoryImpl(pictureDataSource: PictureDataSource())));


  @override
  Widget build(BuildContext context) {
    // final viewModel = context.watch<RecipeViewModel>();
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
                      future: _viewModel.getPicture('사과'),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return CircularProgressIndicator();
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
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text('레시피'),
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
