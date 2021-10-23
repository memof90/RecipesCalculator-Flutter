import 'package:flutter/material.dart';

import '../Model/recipes.dart';



 class RecipeDetail extends StatefulWidget {
   final Recipe recipe;

   const RecipeDetail({
    Key? key, required this.recipe
   }) : super(key: key);

   @override
   _RecipeDetailState createState() => _RecipeDetailState();
 }

 class _RecipeDetailState extends State<RecipeDetail> {
   // TODO: Variable to managed Slider
   int _sliderVal = 1;

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image(
                  image: AssetImage(widget.recipe.imageUrl),
                ),
              ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.recipe.label,
              style: const TextStyle(fontSize: 18),
            ),
            // TODO: Add Expanded
            Expanded(child: ListView.builder(
                padding: const EdgeInsets.all(7.0),
                itemCount: widget.recipe.ingredients.length ,
                itemBuilder: (BuildContext context, int index) {
                  final ingredient = widget.recipe.ingredients[index];
                  // TODO: Add ingredient.quantity
                  return Text('${ingredient.quantity * _sliderVal}' ' ${ingredient.measure}' '${ingredient.name}');
                },
            ),
            ),
            // TODO: Add Slider()
            Slider(
                min: 1,
                max: 10,
                divisions: 10,
                label: '${_sliderVal * widget.recipe.servings} servings',
                value: _sliderVal.toDouble(),
                onChanged: (newValue) {
                  setState(() {
                    _sliderVal = newValue.round();
                  });
                },
              activeColor: Colors.green,
              inactiveColor: Colors.black,
            ),
          ],
        ),
      ),
    );
   }
 }
