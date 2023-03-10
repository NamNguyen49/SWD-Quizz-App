import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/question.dart';
import 'package:flutter_quiz_app/screens/login_screen.dart';
import 'package:flutter_quiz_app/screens/payment_screen.dart';
import 'package:flutter_quiz_app/screens/profile_screen.dart';
import 'package:flutter_quiz_app/screens/question_detail_screen.dart';
import 'package:flutter_quiz_app/widgets/cart_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoggedIn = true;

  void _logout() {
    setState(() {
      _isLoggedIn = false;
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 68, 103, 119),
                Color.fromARGB(255, 144, 191, 230),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
        ),
        title: Text(
          "FUS",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 34.0,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('T??m ki???m'),
                    content: TextField(
                      decoration:
                          InputDecoration(hintText: 'Nh???p t??? kh??a t??m ki???m'),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          // X??? l?? t??m ki???m ??? ????y
                          Navigator.pop(context);
                        },
                        child: Text('T??m'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('????ng'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          // PopupMenuButton(
          //   itemBuilder: (context) => [
          //     PopupMenuItem(
          //       child: InkWell(
          //         onTap: () {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(builder: (context) => ProfileScreen()),
          //           );
          //         },
          //         child: Text('Profile'),
          //       ),
          //     ),
          //     PopupMenuItem(
          //       child: InkWell(
          //         onTap: () {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(builder: (context) => PaymentScreen()),
          //           );
          //         },
          //         child: Text('Payment'),
          //       ),
          //     ),
          //     PopupMenuItem(
          //       child: Text('Setting'),
          //     ),
          //     PopupMenuItem(
          //       child: Text('Login'),
          //       value: 'login',
          //     ),
          //   ],
          //   onSelected: (value) {
          //     if (value == 'login') {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => LoginScreen()),
          //       );
          //     }
          //   },
          // )
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                  child: Text('Profile'),
                ),
              ),
              PopupMenuItem(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaymentScreen()),
                    );
                  },
                  child: Text('Payment'),
                ),
              ),
              PopupMenuItem(
                child: Text('Setting'),
              ),
              PopupMenuItem(
                child: Text(_isLoggedIn ? 'Logout' : 'Login'),
                value: _isLoggedIn ? 'logout' : 'login',
              ),
            ],
            onSelected: (value) {
              if (value == 'login') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                ).then((value) {
                  if (value == true) {
                    setState(() {
                      _isLoggedIn = true;
                    });
                  }
                });
              } else if (value == 'logout') {
                _logout();
              }
            },
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 150,
            // color: Color.fromARGB(255, 140, 198, 245),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 68, 103, 119),
                  Color.fromARGB(255, 144, 191, 230),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              // borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 20,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuestionDetailScreen(),
                            ),
                          );
                        },
                        child: CartWidget(
                          title: "Assigment_ISC_",
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 20,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuestionDetailScreen(),
                            ),
                          );
                        },
                        child: CartWidget(
                          title: "Project_sale_app",
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20), // Kho???ng c??ch gi???a 2 h??ng
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 20,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuestionDetailScreen(),
                            ),
                          );
                        },
                        child: CartWidget(
                          title: "ResearchMkt",
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 20,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuestionDetailScreen(),
                            ),
                          );
                        },
                        child: CartWidget(
                          title: "Template_recycleview",
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 68, 103, 119),
                    Color.fromARGB(255, 144, 191, 230),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'C??u h???i m???i nh???t',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 200, // gi???i h???n chi???u cao c???a ListView.builder
                      child: ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text("Question ${index + 1}"),
                            subtitle: Text('Created at: 06/03/2023'),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'C??u h???i ph??? bi???n',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 200, // gi???i h???n chi???u cao c???a ListView.builder
                      child: ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text("Question ${index + 1}"),
                            subtitle: Text('Answer count : 99'),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 68, 103, 119),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Shop",
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              child: Icon(Icons.person),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
            ),
            label: "Profile",
          )
        ],
      ),
    );
  }
}
