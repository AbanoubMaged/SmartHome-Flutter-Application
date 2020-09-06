import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black38,
        title: Text('About', style: TextStyle(fontWeight: FontWeight.w400)),
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Text(
                    'Smart Home v1.0',
                    style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),

                SizedBox(height: 30),
                
                Text(
                  'Made by',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300
                  ),
                ),

                SizedBox(height: 30),

                // gridView for team members
                Container(
                  height: MediaQuery.of(context).size.height / 2.27 ,//- 515,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    // color: Colors.black45
                  ),
                  child: GridView.count(
                    crossAxisCount: 2,
                    scrollDirection: Axis.vertical,
                    children: <Widget>[

                      Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        color: Colors.black54,
                        elevation: 4,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: 11),
                              CircleAvatar(
                                radius: 50,
                                // backgroundColor: Colors.white10,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50.0),
                                  child: Image(
                                    image: AssetImage('assets/abanoub.jpg')
                                  ),
                                )
                              ),

                              ListTile(
                                title: Text(
                                  'Abanoub Maged',
                                  style: TextStyle(
                                    color: Colors.cyan[600],
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400
                                  )
                                ),

                                subtitle: Text(
                                  'Network Engineer & Android Developer',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w200,
                                    fontSize: 10
                                  )
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        color: Colors.black54,
                        elevation: 4,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: 11),
                              CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.white10,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50.0),
                                  child: Image(
                                    image: AssetImage('assets/mina.jpeg')
                                  ),
                                )
                              ),

                              ListTile(
                                title: Text(
                                  'Mina Girgis',
                                  style: TextStyle(
                                    color: Colors.cyan[600],
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400
                                  )
                                ),

                                subtitle: Text(
                                  'Network Engineer',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w200,
                                    fontSize: 10
                                  )
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),

                      Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        color: Colors.black54,
                        elevation: 4,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[

                              SizedBox(height: 11),

                              CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.white10,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50.0),
                                  child: Image(
                                    image: AssetImage('assets/philo.jpg')
                                  ),
                                )
                              ),

                              ListTile(
                                title: Text(
                                  'Philopater Emad',
                                  style: TextStyle(
                                    color: Colors.cyan[600],
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400
                                  )
                                ),

                                subtitle: Text(
                                  'Hardware Engineer & Fullstack Developer',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w200,
                                    fontSize: 10
                                  )
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),

                      Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        color: Colors.black54,
                        elevation: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 11),
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.white10,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50.0),
                                  child: Image(
                                    image: AssetImage('assets/khalaf.jpg')
                                  ),
                                )
                            ),

                            ListTile(
                              title: Text(
                                'Mohamed Tarek',
                                style: TextStyle(
                                  color: Colors.cyan[600],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400
                                )
                              ),

                              subtitle: Text(
                                'Network Engineer',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w200,
                                  fontSize: 10
                                )
                              ),
                            ),

                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                
                SizedBox(height: 80),

                Text(
                  'Under The Supervision of',
                  style: TextStyle(
                    color: Colors.cyan,
                    fontSize: 21,
                    fontWeight: FontWeight.bold
                  ),
                ),

                Text(
                  'Dr. Nour Eldeen Mahmoud khalifa',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w300
                  ),
                ),

                SizedBox(height: 80),

                 Text(
                  'For Year 2019/2020',
                  style: TextStyle(
                    color: Colors.cyan,
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}