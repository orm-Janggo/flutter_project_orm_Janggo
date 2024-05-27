import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/data/db/like_hive/like_item.dart';

class LikeRecipeDetailScreen extends StatefulWidget {
  final LikeItem recipe;

  const LikeRecipeDetailScreen({
    super.key,
    required this.recipe,
  });

  @override
  State<LikeRecipeDetailScreen> createState() => _LikeRecipeDetailScreenState();
}

class _LikeRecipeDetailScreenState extends State<LikeRecipeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.recipe.foodName),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: 265,
                width: 400,
                child: widget.recipe.imageUrl.isNotEmpty
                    ? Image.network(
                        widget.recipe.imageUrl,
                        height: 265,
                        width: 400,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/images/empty_image.png',
                        height: 265,
                        width: 400,
                        fit: BoxFit.cover,
                      ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.amber[50],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      widget.recipe.recipe,
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
            ],
          ),
        ));
  }
}
