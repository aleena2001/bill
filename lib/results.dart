import 'package:flutter/material.dart';
class Results extends StatefulWidget {
final String total;
final String tax;
final double people;
final double tip;
Results(this.total,this.tax,this.people,this.tip);
  @override
  _State createState() => _State();
}

// ignore: camel_case_types
class _State extends State<Results> {
  String dividedamount;
  @override
  void initState(){
    super.initState();
    amount();
  }
  
  amount() {
    double taxamount=double.parse(widget.total) * (double.parse(widget.tax) /100);
    double finaltotal=(double.parse(widget.total) + taxamount+widget.tip)/ widget.people;
  setState(() {
      dividedamount=finaltotal.toStringAsFixed(2);
    });
  

 

}
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 20,right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top:40),
              child: Text("Result",
              
              style:TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 25,color: Colors.black,
                          )
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 15),
                width:MediaQuery.of(context).size.width,
                height:100,
                decoration: BoxDecoration(
                  color: Colors.green
                ),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(17.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Equally Divided',style:TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                          ),),
                          
                          Text(dividedamount,
                          style:TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 30,)),
                        ],
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            
                              children: [
                                Text('People',style:TextStyle(fontWeight: FontWeight.bold),),
                                Text('Tax',style:TextStyle(fontWeight: FontWeight.bold),),
                                Text('Tip',style:TextStyle(fontWeight: FontWeight.bold),),
                              ],
                            ),
                            SizedBox(width:10,),
                            Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        
                          children: [
                            Text(widget.people.round().toString(),style:TextStyle(fontWeight: FontWeight.bold),),
                            Text('${widget.tax} %',style:TextStyle(fontWeight: FontWeight.bold),),
                            Text(widget.tip.round().toString(),style:TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                        ],
                      ),
                    ),
                      
                    
                  ],
                ) ,
            ),
          ],
        ),),
    );
  }
}