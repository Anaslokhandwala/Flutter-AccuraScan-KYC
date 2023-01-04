import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:accura_sdk/accura_sdk.dart';

void main() {
  runApp(const FaceMatch());
}

class FaceMatch extends StatefulWidget {
  const FaceMatch({Key? key}) : super(key: key);

  @override
  State<FaceMatch> createState() => _FaceMatchState();
}

class _FaceMatchState extends State<FaceMatch> {

  dynamic _result = {'isValid': false};
  String facematchURI = '';
  String facematchURI2 = '';
  String Score = "0.0";

  Future<void> openGallery() async{
    try{
      var accuraConfs = {
        "face1": this.facematchURI,
        "face2": this.facematchURI2
      };

      await AccuraSdk.getGallery1([accuraConfs]).then((value) => {
        setState(() {
          _result = json.decode(value);
          facematchURI = _result["Image"];
          if(_result.toString().contains("score")){
            Score = _result["score"];
          }
          print("RESULT:- $_result");
        })
      }).onError((error, stackTrace)=>{});
    } on PlatformException {}
    if(!mounted) return;
  }

  Future<void> openGallery2() async{
    try{
      var accuraConfs = {
        "face1": this.facematchURI,
        "face2": this.facematchURI2
      };
      await AccuraSdk.getGallery2([accuraConfs]).then((value) => {
        setState(() {
          _result = json.decode(value);
          facematchURI2 = _result["Image"];
          if(_result.toString().contains("score")){
            Score = _result["score"];
          }
          print("RESULT:- $_result");
        })
      }).onError((error, stackTrace)=>{});
    } on PlatformException {}
    if(!mounted) return;
  }

  Future<void> openCamera() async{
    try{
      var accuraConfs = {
        "face1": this.facematchURI,
        "face2": this.facematchURI2
      };
      await AccuraSdk.setFaceMatchFeedbackTextSize(18);
      await AccuraSdk.setFaceMatchFeedBackframeMessage("Frame Your Face");
      await AccuraSdk.setFaceMatchFeedBackAwayMessage("Move Phone Away");
      await AccuraSdk.setFaceMatchFeedBackOpenEyesMessage("Keep Your Eyes Open");
      await AccuraSdk.setFaceMatchFeedBackCloserMessage("Move Phone Closer");
      await AccuraSdk.setFaceMatchFeedBackCenterMessage("Move Phone Center");
      await AccuraSdk.setFaceMatchFeedbackMultipleFaceMessage("Multiple Face Detected");
      await AccuraSdk.setFaceMatchFeedBackFaceSteadymessage("Keep Your Head Straight");
      await AccuraSdk.setFaceMatchFeedBackLowLightMessage("Low light detected");
      await AccuraSdk.setFaceMatchFeedBackBlurFaceMessage("Blur Detected Over Face");
      await AccuraSdk.setFaceMatchFeedBackGlareFaceMessage("Glare Detected");
      await AccuraSdk.setBlurPercentage(80);
      await AccuraSdk.setFaceMatchGlarePercentage_0(-1);
      await AccuraSdk.setFaceMatchGlarePercentage_1(-1);

      await AccuraSdk.getCamera1([accuraConfs]).then((value) => {
        setState(() {
          _result = json.decode(value);
          facematchURI = _result["Image"];
          if(_result.toString().contains("score")){
            Score = _result["score"];
          }
          print("RESULT:- $_result");
        })
      });
    } on PlatformException {}
    if(!mounted) return;
  }


  Future<void> openCamera2() async{
    try{
      var accuraConfs = {
        "face1": this.facematchURI,
        "face2": this.facematchURI2
      };

      await AccuraSdk.setFaceMatchFeedbackTextSize(18);
      await AccuraSdk.setFaceMatchFeedBackframeMessage("Frame Your Face");
      await AccuraSdk.setFaceMatchFeedBackAwayMessage("Move Phone Away");
      await AccuraSdk.setFaceMatchFeedBackOpenEyesMessage("Keep Your Eyes Open");
      await AccuraSdk.setFaceMatchFeedBackCloserMessage("Move Phone Closer");
      await AccuraSdk.setFaceMatchFeedBackCenterMessage("Move Phone Center");
      await AccuraSdk.setFaceMatchFeedbackMultipleFaceMessage("Multiple Face Detected");
      await AccuraSdk.setFaceMatchFeedBackFaceSteadymessage("Keep Your Head Straight");
      await AccuraSdk.setFaceMatchFeedBackLowLightMessage("Low light detected");
      await AccuraSdk.setFaceMatchFeedBackBlurFaceMessage("Blur Detected Over Face");
      await AccuraSdk.setFaceMatchFeedBackGlareFaceMessage("Glare Detected");
      await AccuraSdk.setBlurPercentage(80);
      await AccuraSdk.setFaceMatchGlarePercentage_0(-1);
      await AccuraSdk.setFaceMatchGlarePercentage_1(-1);

      await AccuraSdk.getCamera2([accuraConfs]).then((value) => {
        setState(() {
          _result = json.decode(value);
          facematchURI2 = _result["Image"];
          if(_result.toString().contains("score")){
            Score = _result["score"];
          }
          print("RESULT:- $_result");
        })
      });//.onError((error, stackTrace)=>{print("Not Printing")});
    } on PlatformException {}
    if(!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text('Accura KYC'),
          backgroundColor: Colors.red[800],
        ),
        body: Center(
          child: Column(
            children: [
              facematchURI != ''
                  ? Container(
                margin: EdgeInsets.only(left: 50),
                height: 150,
                width: 100,
                child: Image.file(
                  new File(
                      facematchURI.replaceAll("file:///", '')),
                ),
              )
                  : Container(),
              Center(
                child: Row(
                  mainAxisAlignment:  MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                            ),
                            padding: EdgeInsets.only(
                                top: 10, bottom: 10, right: 20, left: 20),
                            primary: Colors.red[800]),
                        onPressed: (){
                      openGallery();
                    },
                        child: Text("Open Gallery")
                    ),

                    SizedBox(width: 10,),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                            ),
                            padding: EdgeInsets.only(
                                top: 10, bottom: 10, right: 20, left: 20),
                            primary: Colors.red[800]),
                        onPressed: (){
                      openCamera();
                    },
                        child: Text("Open Camera")
                    ),
                  ],
                ),
              ),


              SizedBox(height: 10,),
              facematchURI2 != ''
                  ? Container(
                margin: EdgeInsets.only(left: 50),
                height: 150,
                width: 100,
                child: Image.file(
                  new File(
                      facematchURI2.replaceAll("file:///", '')),
                ),
              )
                  : Container(),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                            ),
                            padding: EdgeInsets.only(
                                top: 10, bottom: 10, right: 20, left: 20),
                            primary: Colors.red[800]),
                        onPressed: (){
                      print("jbhjhjbj");
                      openGallery2();
                    },
                        child: Text("Open Gallery")
                    ),

                    SizedBox(width: 10,),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                            ),
                            padding: EdgeInsets.only(
                                top: 10, bottom: 10, right: 20, left: 20),
                            primary: Colors.red[800]),
                        onPressed: (){
                      print("jbhjhjbj");
                      openCamera2();
                    },
                        child: Text("Open Camera")
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
                  Text("MatchScore is $Score")
            ],
          ),
        ),
      ),
    );
  }
}
