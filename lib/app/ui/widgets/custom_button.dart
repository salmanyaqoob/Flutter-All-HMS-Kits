/*
    Copyright 2020. Huawei Technologies Co., Ltd. All rights reserved.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/

import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  Btn(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Color.fromRGBO(35, 151, 239, 1),
      textColor: Color.fromRGBO(255, 255, 255, 1),
      padding: EdgeInsets.symmetric(horizontal: 10),
      splashColor: Colors.lightBlue,
      child: Text(text, style: TextStyle(fontSize: 14)),
      onPressed: onPressed,
    );
  }
}