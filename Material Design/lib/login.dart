// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';

import 'supplemental/colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/diamond.png'),
                SizedBox(height: 16.0),
                Text('SHRINE'),
              ],
            ),
            SizedBox(height: 120.0),
            AccentColorOverride(
              color: kShrineBrown900,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
                controller: _usernameController,
              ),
            ),
            SizedBox(height: 12.0),
            AccentColorOverride(
              color: kShrineBrown900,
              child: TextField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                controller: _passwordController,
              ),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                    child: Text('CANCEL'),
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                    onPressed: () {
                      _usernameController.clear();
                      _passwordController.clear();
                    }),
                RaisedButton(
                    child: Text('NEXT'),
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                    elevation: 8,
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}

final _usernameController = TextEditingController();
final _passwordController = TextEditingController();

class AccentColorOverride extends StatelessWidget {
  final Color color;
  final Widget child;

//  const AccentColorOverride({Key key, this.color, this.child})
//      : super(key: key);

  const AccentColorOverride({this.color, this.child});

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(
        accentColor: color,
        brightness: Brightness.dark,
      ),
    );
  }
}
