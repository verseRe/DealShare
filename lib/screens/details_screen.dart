import 'package:dealshare/images.dart';
import 'package:dealshare/size_config.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:share_plus/share_plus.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var portrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        title: Text("Fish Foldover Promo!"),
        backgroundColor: Colors.cyan,
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () => Navigator.of(context).pop()),
        automaticallyImplyLeading: true,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(1.5 * SizeConfig.heightMultiplier),
                    child: Container(
                      width: portrait
                          ? 85 *
                              SizeConfig
                                  .widthMultiplier /*MediaQuery.of(context).size.width*/ : 300,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            2 * SizeConfig.heightMultiplier),
                        child: Image.asset(
                          Images.mcdetails,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Images.fiveStar,
                        width: 20 * SizeConfig.widthMultiplier,
                      ),
                      FittedBox(
                          child: FittedBox(
                        child: Text(
                          "45 Ratings",
                          style: TextStyle(
                              fontSize: 1.6 * SizeConfig.textMultiplier),
                        ),
                      )),
                      SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        width: 42 * SizeConfig.widthMultiplier,
                        child: TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all<double>(0),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    side: BorderSide(
                                        color: Colors.black, width: 0.5))),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 2 * SizeConfig.heightMultiplier,
                              ),
                              SizedBox(
                                width: 2 * SizeConfig.widthMultiplier,
                              ),
                              FittedBox(
                                child: Text("Add to favourites"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    4.2 * SizeConfig.widthMultiplier,
                    0.4 * SizeConfig.heightMultiplier,
                    4.2 * SizeConfig.widthMultiplier,
                    0.4 * SizeConfig.heightMultiplier),
                padding: EdgeInsets.fromLTRB(
                    4.2 * SizeConfig.widthMultiplier,
                    0.4 * SizeConfig.heightMultiplier,
                    4.2 * SizeConfig.widthMultiplier,
                    0.4 * SizeConfig.heightMultiplier),
                child: Column(
                  children: [
                    Text(
                      'Buy 1 Free 1 Fish Foldover Promo',
                      style: TextStyle(fontSize: 2 * SizeConfig.heightMultiplier,fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\n• Offer is limited to single redemption per transaction \n• Show QR code while ordering \n• Valid in Malaysia only',
                      style:
                          TextStyle(fontSize: 1.5 * SizeConfig.textMultiplier),
                    ),
                  ],
                ),
              ),
              //Text("ABC12345"),
              SizedBox(height: 1.6 * SizeConfig.heightMultiplier),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.remove_red_eye_outlined),
                  GestureDetector(
                    child: Text(" View Promo Code"),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) => AssetGiffyDialog(
                            image: Image.asset(
                              Images.qrcode,
                            ),
                            title: Text(
                              'Promo Code: A77B7A',
                              style: TextStyle(
                                  fontSize: 1.8 * SizeConfig.textMultiplier,
                                  fontWeight: FontWeight.w600),
                            ),
                            description: Text(
                              'Valid until 15/5/2021. Present this screen to cashier to enjoy voucher.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 1.3 * SizeConfig.textMultiplier,
                              ),
                            ),
                            entryAnimation: EntryAnimation.BOTTOM_RIGHT,
                            buttonOkColor: Colors.cyan,
                            onOkButtonPressed: () {
                              Navigator.pop(context);
                            },
                          ));
                    },
                  ),
                ],
              ),

              SizedBox(
                height: 1.6 * SizeConfig.heightMultiplier,
              ),

              Text("Valid until 15/5/2021"),

              SizedBox(
                height: 1.6 * SizeConfig.heightMultiplier,
              ),
              SizedBox(
                width: 80 * SizeConfig.widthMultiplier,
                height: 6 * SizeConfig.heightMultiplier,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.cyan),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {
                    Share.share('check out my website https://example.com');
                  },
                  child: Text(
                    'Share',
                    style: TextStyle(fontSize: 2 * SizeConfig.textMultiplier),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
