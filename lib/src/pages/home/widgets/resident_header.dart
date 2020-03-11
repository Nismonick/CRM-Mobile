import 'package:flutter/material.dart';

class ResidentHeader extends StatelessWidget {

  ResidentHeader({
    this.minExtent,
    this.maxExtent,
    this.offset
  });
  final double minExtent;
  final double maxExtent;
  final double offset;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        width: MediaQuery.of(context).size.width,
        height: residentHeaderSize(offset),
        child: Center( 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 10,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      child: Transform.translate(
                        offset: Offset( avatarTranslationX(offset), avatarTranslationY(offset) ),
                        child: Transform.scale(
                        scale: avatarSize(offset),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(40.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(117, 173, 193, .9),
                                  blurRadius:20.0,
                                  spreadRadius: 5.0,
                                  offset: Offset(
                                    0.0, 20.0
                                  )
                                )
                              ]
                            ),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('assets/images/nick.jpg'),
                            ),
                          )
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(nameTranslationX(offset),nameTranslationY(offset) ),
                      child: SizedBox(
                        child: Text(
                          'Nicolas Barrionuevo' , 
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                            fontFamily: '.SF UI Display'
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Transform.translate(
                        offset: Offset(residentNumTranslationX(offset),residentNumTranslationY(offset) ),
                        child:  Text(
                            'CRM #10101',
                            style: TextStyle(
                              color: Color.fromRGBO(68, 111, 126, 1),
                            ),
                          ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }

  double avatarSize(double offset){
    double maxOffset = 75.0;
    double maxExtent = 150.0;

    if(offset <= maxOffset)
    {
      return -(offset-maxExtent) / maxExtent;
    }
    else{
      return (0.5 - (-(offset-maxExtent) / maxExtent))+ (-1*(offset-maxExtent)) / maxExtent;
    }
  }

  double avatarTranslationX(double offset){

    double maxOffset = 130.0;

    if(offset <= maxOffset)
    {
      return -offset;
    }
    else{
      return -maxOffset;
    }
  }

  double avatarTranslationY(double offset){

    double maxOffset = 25.0;

    if(offset <= maxOffset)
    {
      return -offset;
    }
    else{
      return -maxOffset;
    }
  }
  
  double nameTranslationX(double offset) {
    return offset * 0.14;
  }

  double nameTranslationY(double offset) {

    double maxOffset = 100.0;

    if(offset <= maxOffset)
    {
      return -offset;
    }
    else{
      return -maxOffset;
    }
  }

  double residentNumTranslationX(double offset){
    return offset * 0.14;
  }

  double residentNumTranslationY(double offset){
    double maxOffset = 100.0;

    if(offset <= maxOffset)
    {
      return -offset;
    }
    else{
      return -maxOffset;
    }
  }
  
  double residentHeaderSize(double offset){
    double minExtent = 60.0;
    double maxExtent = 150.0;

    return minExtent + (maxExtent-offset) * 0.6;
  }
}

