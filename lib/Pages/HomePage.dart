import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  final List<Map<String,dynamic>> products = [
    {
      'imgPath' : 'assets/images/img1.png',
      'title':'image 1 is here',
      'price':'\$299',
      'rating':'4.0',
      'ratingCount':'20',
      'isLocked':true,
    },
    {
      'imgPath' : 'assets/images/img2.png',
      'title':'image 2 is here',
      'price':'\$300',
      'rating':'4.5',
      'ratingCount':'30',
      'isLocked':false,
    },
    {
      'imgPath' : 'assets/images/img3.png',
      'title':'image 3 is here',
      'price':'\$150',
      'rating':'3.5',
      'ratingCount':'15',
      'isLocked':true,
    },

  ];

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      drawerEnableOpenDragGesture: true,

      appBar: AppBar(

        title: Image.asset('assets/images/logo.png',width: 150,height: 60,),
        actions: [
          IconButton(
            icon: const Icon(Icons. shopping_cart),
            tooltip: 'Open shopping cart',

            onPressed: () {
              // handle the press

            },
          ),
          const SizedBox(width: 10,),
          IconButton(
            icon: const Icon(Icons.person_2_outlined),
            tooltip: 'Open shopping cart',

            onPressed: () {
              // handle the press

            },
          ),
        ],
      ),
      drawer: const Drawer(
        child: Text('Drawer'),
      ),

      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.32,
              width: MediaQuery.of(context).size.width * 1,
              child: PageView(
                scrollDirection: Axis.horizontal,
                children: const <Widget>[
                  Center(
                    child: Image(image: AssetImage('assets/images/img5.webp'),width: 500,height: 240,fit: BoxFit.contain,),
                  ),
        
                  Center(
                    child: Image(image: AssetImage('assets/images/img4.jpg'),width: 500,height: 240,fit: BoxFit.contain,),
                  ),
        
                  Center(
                    child: Image(image: AssetImage('assets/images/img6.png'),width: 500,height: 240,fit: BoxFit.contain,),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: 490,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueGrey,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 Container(
                   height: 70,
                   width: 70,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(15),
                   ),
                   child: const Image(image: AssetImage('assets/images/img1.png'),isAntiAlias: true),
                 ),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),

                    ),
                    child: const Image(image: AssetImage('assets/images/img2.png'),fit: BoxFit.fitWidth),
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),

                    ),
                    child: const Image(image: AssetImage('assets/images/img3.png'),fit: BoxFit.cover),
        
                  )
                ],
              ),
            ),
        
            const SizedBox(height: 10,),
            Container(
              height: MediaQuery.of(context).size.height * 0.55,
              width: MediaQuery.of(context).size.width * 0.97,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadiusDirectional.circular(10),
              ),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    height: 100,
                    color: Colors.red,
                    child: Text(products.first['title']),
                  ),
                  Container(
                    height: 100,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 100,
                    color: Colors.grey,
                  ),Container(
                    height: 100,
                    color: Colors.orange,
                  ),
                  Container(
                    height: 100,
                    color: Colors.yellow,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
