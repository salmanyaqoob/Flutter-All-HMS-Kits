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
import 'package:huawei_ads/hms_ads_lib.dart';
import 'package:hmsallkitsflutter/app/utils/constants.dart';

class BannerAdPage extends StatefulWidget {
  @override
  _BannerAdPageState createState() => _BannerAdPageState();
}

class _BannerAdPageState extends State<BannerAdPage> {
  static final String _testAdSlotId = "testw6vs28auh3";
  final AdParam _adParam = AdParam.build();
  BannerAdSize bannerAdSize = BannerAdSize.s320x50;
  BannerAd _bannerAd;

  void changeSize(BannerAdSize size) {
    if(_bannerAd != null)
      print ('Previous Banner size - width ${_bannerAd.size.width} : height ${_bannerAd.size.height}');

    setState(() {
      bannerAdSize = size;
    });
  }

  BannerAd createBannerAd() {
    return BannerAd(
      adUnitId: _testAdSlotId,
      size: bannerAdSize,
      adParam: _adParam,
      bannerRefreshTime: 5000,
      listener: (AdEvent event, {int errorCode}) {
        print("BannerAd event $event");
      },
    );
  }

  void testBannerAdSizeMethods() async {
    print ('isFullWidthSize : ${bannerAdSize.isFullWidthSize}');
    print ('isDynamicSize : ${bannerAdSize.isDynamicSize}');
    print ('isAutoHeightSize : ${bannerAdSize.isAutoHeightSize}');

    int widthPx = await bannerAdSize.getWidthPx;
    print('widthPx : $widthPx');

    int heightPx = await bannerAdSize.getHeightPx;
    print('heightPx : $heightPx');

    BannerAdSize currentDir = await BannerAdSize.getCurrentDirectionBannerSize(150);
    print ('getCurrentDirectionBannerSize - width ${currentDir.width} : height ${currentDir.height}');

    BannerAdSize landscape = await BannerAdSize.getLandscapeBannerSize(150);
    print ('getLandscapeBannerSize - width ${landscape.width} : height ${landscape.height}');

    BannerAdSize portrait = await BannerAdSize.getPortraitBannerSize(150);
    print ('getPortraitBannerSize - width ${portrait.width} : height ${portrait.height}');
  }

  @override
  void initState() {
    super.initState();
    testBannerAdSizeMethods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(
            'Huawei Ads - Banner',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text('Size 320 x 50'),
                              trailing: Radio(
                                groupValue: bannerAdSize,
                                value: BannerAdSize.s320x50,
                                onChanged: changeSize,
                              ),
                            ),
                            ListTile(
                              title: Text('Size 320 x 100'),
                              trailing: Radio(
                                groupValue: bannerAdSize,
                                value: BannerAdSize.s320x100,
                                onChanged: changeSize,
                              ),
                            ),
                            ListTile(
                              title: Text('Size 320 x 250'),
                              trailing: Radio(
                                groupValue: bannerAdSize,
                                value: BannerAdSize.s300x250,
                                onChanged: changeSize,
                              ),
                            ),
                            ListTile(
                              title: Text('Size SMART'),
                              trailing: Radio(
                                groupValue: bannerAdSize,
                                value: BannerAdSize.sSmart,
                                onChanged: changeSize,
                              ),
                            ),
                            ListTile(
                              title: Text('Size 360 x 57'),
                              trailing: Radio(
                                groupValue: bannerAdSize,
                                value: BannerAdSize.s360x57,
                                onChanged: changeSize,
                              ),
                            ),
                            ListTile(
                              title: Text('Size 360 x 144'),
                              trailing: Radio(
                                groupValue: bannerAdSize,
                                value: BannerAdSize.s360x144,
                                onChanged: changeSize,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          child: Text(
                            'Load Banner',
                            style: Styles.adControlButtonStyle,
                          ),
                          onPressed: () {
                            _bannerAd ??= createBannerAd();
                            _bannerAd
                              ..loadAd()
                              ..show();
                          },
                        ),
                        RaisedButton(
                          child: Text(
                            'Remove Banner',
                            style: Styles.adControlButtonStyle,
                          ),
                          onPressed: (){
                            _bannerAd?.destroy();
                            _bannerAd = null;
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(),
            )
          ],
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _bannerAd?.destroy();
    _bannerAd = null;
  }
}