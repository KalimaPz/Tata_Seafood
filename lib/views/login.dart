import 'package:flutter/material.dart';
import 'package:sdm_mini_project/actions/auth.dart';
import 'package:sdm_mini_project/views/menu/Backend.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    double textfield_width = MediaQuery.of(context).size.width - 100;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://flutter-examples.com/wp-content/uploads/2020/02/dice.jpg'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 128,
              height: 128,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 50.0,
                      bottom: 100,
                      left: 30,
                      right: 30,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                            width: textfield_width,
                            child: TextField(
                              decoration: InputDecoration(hintText: 'Username'),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: textfield_width,
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(hintText: 'Password'),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: 
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  onPressed: () {
                                    Auth().signIn(
                                      email: ,password: 'zaq12wsx'
                                    ).then((result) {
                                      if(result != null) {
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Backend(),));
                                      }
                                      else {
                                        print('Error');
                                      }
                                    });
                
                                  },
                                  child: Text('Sign In as Owner')),
                            ),

          
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
