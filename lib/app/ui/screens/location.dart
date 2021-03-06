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

import 'package:hmsallkitsflutter/app/ui/widgets/custom_button.dart';

import 'package:hmsallkitsflutter/app/ui/screens/location/pages/location_flow.dart';
import 'package:hmsallkitsflutter/app/ui/screens/location/pages/activity_screen.dart';
import 'package:hmsallkitsflutter/app/ui/screens/location/pages/fusedlocation_screen.dart';
import 'package:hmsallkitsflutter/app/ui/screens/location/pages/geofence_screen.dart';
import 'package:hmsallkitsflutter/app/ui/widgets/header.dart';

class LocationPage extends StatelessWidget {
  static const String routeName = "LocationPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HMS Location Kit Flutter Demo'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            HeaderWidget(
              title: "HMS Location Kit",
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Btn("Location Flow", () {
                  Navigator.pushNamed(
                    context,
                    LocationFlowPage.routeName,
                  );
                }),
                Btn("Fused Location Service", () {
                  Navigator.pushNamed(
                    context,
                    FusedLocationScreen.routeName,
                  );
                }),
                Btn("Activity Identification/Recognition Service", () {
                  Navigator.pushNamed(
                    context,
                    ActivityScreen.routeName,
                  );
                }),
                Btn("Geofence Service", () {
                  Navigator.pushNamed(
                    context,
                    GeofenceScreen.routeName,
                  );
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
