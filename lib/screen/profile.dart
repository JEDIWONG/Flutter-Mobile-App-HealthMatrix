import 'package:flutter/material.dart';
import 'package:health_matrix/component/list_item.dart';
import 'package:health_matrix/screen/auth.dart';

class Profile extends StatelessWidget{
  const Profile({super.key, required this.age, required this.gender, required this.weight, required this.height});

  final int age;
  final String gender;
  final double weight;
  final double height;
  
  double getBmi(){

    double bmi = (weight/((height/100)*(height/100))).toDouble();

    return bmi;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1,
                    offset: Offset(0, 1),
                    blurStyle: BlurStyle.normal,
                    color: Colors.grey,
                  
                  )
                ]
              ),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    leading: const Text("Biometrics",style: TextStyle(fontSize: 24),),
                    trailing: IconButton(
                          onPressed: (){},
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white
                          ),
                          icon: const Icon(Icons.edit_square)
                        ),
                  ),
                  
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      SizedBox(
                        width: 150,
                        height: 100,
                        child: IdCard(icon: Icons.cake_rounded, title: "Age", value: age.toString()),

                      ),
                      const SizedBox(width: 10,),
                      SizedBox(
                        width: 150,
                        height: 100,
                        child: IdCard(icon: Icons.male, title: "Gender", value: gender),
                      ),
                      
                    ],
                  ),
                  const SizedBox(height: 10,),
                  IdCard(icon: Icons.monitor_weight, title: "Weight (KG)", value: weight.toString()),
                  const SizedBox(height: 10,),
                  IdCard(icon: Icons.height_rounded, title: "Height (CM)", value: height.toString()),
                  const SizedBox(height: 10,),
                  IdCard(icon: Icons.balance_rounded, title: "BMI", value: getBmi().toStringAsFixed(1))
                  
                ],
              ),
            ),
            
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: const Column(
                children: [
                  ListItem(title: "Account", icon: Icons.account_circle_rounded),
                  ListItem(title: "Help", icon: Icons.live_help_rounded),
                  ListItem(title: "About Us", icon: Icons.emoji_people_rounded),
                  ListItem(title: "Setting", icon: Icons.settings),
                ],
                
              ),
            ),
            

            
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: OutlinedButton(
                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const Auth()));},
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.red,
                  fixedSize: Size(MediaQuery.sizeOf(context).width-100, 50),
                  side: const BorderSide(
                    color: Colors.red,
                  )
                ),
                child: const Text("Log Out")
              ),
            )
          ],
        ),
      )
    );
  }
}

class IdCard extends StatelessWidget{
  const IdCard({super.key, required this.icon, required this.title, required this.value});

  final IconData icon;
  final String title;
  final String value;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: 100,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.deepPurpleAccent,
      ),
      child: Column(
        children: [
          ListTile(
            leading: Icon(icon,color: Colors.white,),
            title: Text(title,style: const TextStyle(color: Colors.white),),
          ),
          Text(value,style:const TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 20),),
        ],
      ),
    );
  }
}