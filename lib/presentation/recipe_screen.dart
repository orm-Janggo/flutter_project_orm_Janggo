import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project_orm_janggo/domain/model/picture_model.dart';

class RecipeScreen extends StatefulWidget {
  final PictureModel picture;

  const RecipeScreen({super.key, required this.picture});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  Widget build(BuildContext context) {
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
                    child: Container(),
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
