import 'package:flutter/material.dart';

class recepeHome extends StatelessWidget {
  const recepeHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Text("What would you like to cook today?",style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 40),),
            SizedBox(height: 10,),
           Row(
             children: [
               TextFormField(
                   decoration: const InputDecoration(
                hintText: ('search'),
                 )),
               IconButton(onPressed: (){}, icon: Icon(Icons.search)),

             ],),
               SizedBox(height: 10,),
               Row(
                 children: [
                   Text("todays fresh recipes",style: TextStyle(fontWeight: FontWeight.bold,
          fontSize: 20),),
                   TextButton(onPressed: (){}, child: Text("see All"),)
                 ],

               ),

            Row(
              children: [
                Column(
                  children: [
                    Text("breakfast",style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20),),
                    Text("toast with burries",style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 30),),

                    Row(
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.star)),
                        IconButton(onPressed: (){}, icon: Icon(Icons.star)),
                        IconButton(onPressed: (){}, icon: Icon(Icons.star)),
                        IconButton(onPressed: (){}, icon: Icon(Icons.star)),
                        IconButton(onPressed: (){}, icon: Icon(Icons.star)),

                      ],
                    ),

                    Text("120  calories",style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20),),



                    Row(
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.timer)),

                        Text("10 mims",style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 30),),
                        SizedBox(width: 30,),
                        IconButton(onPressed: (){}, icon: Icon(Icons.timer)),

                        Text("10 mims",style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 30),),

                      ],
                    ),
                  ],
                ),
              ],
            ),

            Column(
              children: [
                Text("breakfast",style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 20),),
                Text("toast with burries",style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 30),),

                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.star)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.star)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.star)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.star)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.star)),

                  ],
                ),

                Text("120  calories",style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 20),),



                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.timer)),

                    Text("10 mims",style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 30),),
                    SizedBox(width: 30,),
                    IconButton(onPressed: (){}, icon: Icon(Icons.timer)),

                    Text("10 mims",style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 30),),

                  ],
                ),
              ],
            ),





          ],

        ),
      )
    );
  }
}
