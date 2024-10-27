import 'package:flutter/material.dart';

class MealsPlanning extends StatefulWidget {
  const MealsPlanning({super.key});

  @override
  _MealsPlanningState createState() => _MealsPlanningState();
}

class _MealsPlanningState extends State<MealsPlanning> {
  final Map<int, List<Map<String, dynamic>>> meals = {
    0: [], // Monday
    1: [], // Tuesday
    2: [], // Wednesday
    3: [], // Thursday
    4: [], // Friday
    5: [], // Saturday
    6: [], // Sunday
  };

  int selectedDay = 0; // Keep track of the current tab index

  void addMeal(Map<String, dynamic> meal) {
    setState(() {
      meals[selectedDay]?.add(meal); // Add meal to the current tab's day list
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meal Planning'),
          bottom: TabBar(
            indicatorColor: Colors.deepPurpleAccent,
            labelColor: Colors.deepPurpleAccent,
            isScrollable: true,
            onTap: (index) {
              setState(() {
                selectedDay = index; // Update the selected day when tab changes
              });
            },
            
            tabs: const [
              Tab(text: 'Mon'),
              Tab(text: 'Tue'),
              Tab(text: 'Wed'),
              Tab(text: 'Thu'),
              Tab(text: 'Fri'),
              Tab(text: 'Sat'),
              Tab(text: 'Sun'),
            ],
          ),
        ),
        body: TabBarView(
          
          children: List.generate(7, (index) {
            return ListView.builder(
              
              itemCount: meals[index]?.length ?? 0,
              itemBuilder: (context, mealIndex) {
                var meal = meals[index]![mealIndex];
                return Container(
                  margin: EdgeInsets.only(top: 1),
                  child: ListTile(
                    tileColor: Colors.deepPurpleAccent,
                    
                    title: Text(meal['name'],style: const TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                    subtitle: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        
                        children: [

                          ListTile(leading: const Text("Calories",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          title: Text("${meal["calories"]}",style: const TextStyle(fontSize: 20,color: Colors.amber),),),

                          ListTile(leading: const Text("Protein",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          title: Text("${meal["protein"]}",style: const TextStyle(fontSize: 20,color: Colors.amber),),),

                          ListTile(leading: const Text("Carbohydrates (g)",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          title: Text("${meal["carbs"]}",style: const TextStyle(fontSize: 20,color: Colors.amber),),),

                          ListTile(leading: const Text("Fat (g)",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          title: Text("${meal["fat"]}",style: const TextStyle(fontSize: 20,color: Colors.amber),),),

                          

                        ],
                      ),
                    )
                  ),
                );
              },
            );
          }),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurpleAccent,
          foregroundColor: Colors.black,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return AddMealSheet(
                  onMealAdded: (meal) => addMeal(meal),
                );
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class AddMealSheet extends StatefulWidget {
  final Function(Map<String, dynamic>) onMealAdded;

  const AddMealSheet({required this.onMealAdded, Key? key}) : super(key: key);

  @override
  _AddMealSheetState createState() => _AddMealSheetState();
}

class _AddMealSheetState extends State<AddMealSheet> {
  String name = "meal";
  double calories = 200;
  double protein = 20;
  double carbohydrates = 30;
  double fat = 10;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Add Meal',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              
              decoration: const InputDecoration(
                labelText: 'Meal Name',
                border: OutlineInputBorder(),
              ),
              onChanged: (value){
                setState(() {
                  name = value;
                });
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Calories"),
                Text(calories.toStringAsFixed(0)),
              ],
            ),
            Slider(
              value: calories,
              min: 0,
              max: 1000,
              divisions: 100,
              label: calories.toStringAsFixed(0),
              onChanged: (value) {
                setState(() {
                  calories = value;
                });
              },
              activeColor: Colors.deepPurpleAccent,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Protein (g)"),
                Text(protein.toStringAsFixed(0)),
              ],
            ),
            Slider(
              value: protein,
              min: 0,
              max: 100,
              divisions: 100,
              label: protein.toStringAsFixed(0),
              onChanged: (value) {
                setState(() {
                  protein = value;
                });
              },
              activeColor: Colors.deepPurpleAccent,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Carbohydrates (g)"),
                Text(carbohydrates.toStringAsFixed(0)),
              ],
            ),
            Slider(
              value: carbohydrates,
              min: 0,
              max: 100,
              divisions: 100,
              label: carbohydrates.toStringAsFixed(0),
              onChanged: (value) {
                setState(() {
                  carbohydrates = value;
                });
              },
              activeColor: Colors.deepPurpleAccent,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Fat (g)"),
                Text(fat.toStringAsFixed(0)),
              ],
            ),
            Slider(
              value: fat,
              min: 0,
              max: 100,
              divisions: 100,
              label: fat.toStringAsFixed(0),
              onChanged: (value) {
                setState(() {
                  fat = value;
                });
              },
              activeColor: Colors.deepPurpleAccent,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                widget.onMealAdded({
                  'name': name,
                  'calories': calories,
                  'protein': protein,
                  'carbs': carbohydrates,
                  'fat': fat,
                });
                Navigator.pop(context); // Close bottom sheet after adding meal
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
