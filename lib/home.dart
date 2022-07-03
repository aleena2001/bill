import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:bill_split/results.dart';
class BillSplit extends StatefulWidget {
  

  @override
  State<BillSplit> createState() => _BillSplitState();
}

class _BillSplitState extends State<BillSplit> {
  double people = 0;
  double tip=0.0;
  String tax='0';
  String total='';
  buildbutton(String text){
    return Expanded(
      child: OutlinedButton(onPressed: (){
        if(text=='Clear'){
          setState(() {
                total='';      
                    });
        }
        else{
          setState(() {
                      total+=text;
                    });
        }
      }, 
      child: Text(text,style:TextStyle(fontWeight: FontWeight.bold,
                fontSize: 22))),
    );
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Split Bill',
        style: TextStyle(
          color: Colors.black
        ), ),
        backgroundColor: Colors.green,
        ),
        body: Container(
          margin: EdgeInsets.only(left: 20,right:20),
          child: Column(
            children: [
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
                          Text('Total Amount',style:TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                          ),),
                          
                          Text(total,
                          style:TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 20,)),
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
                            Text(people.round().toString(),style:TextStyle(fontWeight: FontWeight.bold),),
                            Text('$tax %',style:TextStyle(fontWeight: FontWeight.bold),),
                            Text(tip.round().toString(),style:TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                        ],
                      ),
                    ),
                      
                    
                  ],
                ) ,

              ),
              SizedBox(height:10,),
              Text('How many people?',
              style:TextStyle(fontWeight: FontWeight.bold,
              fontSize: 22),),
              Slider(
                min:0,
                max:20,
                divisions: 20,
                value: people, 
                activeColor: Colors.lightGreen,
                inactiveColor: Colors.grey,
              onChanged: (value){
                setState(() {
                  people=value;                
                                });
              }),
              SizedBox(height:10,),
              Row(children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('TIP',style:TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height:4,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        Container(
                            width: 25,
                            height: 25,
                            child: FloatingActionButton(onPressed: (){
                                setState(() {
                                          tip--;
                                                                });
                            },
                            backgroundColor: Colors.lightGreen[400],
                            child: Icon(Icons.remove,
                            color:Colors.black),
                            ),
                        ),
                        //SizedBox(width:4,),
                        Text(tip.round().toString(),
                        style:TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 22),),
                        //SizedBox(width:4,),
                        Container(
                            width: 25,
                            height: 25,
                            child: FloatingActionButton(onPressed: (){
                                setState(() {
                                          tip++;
                                                                });
                            },
                            backgroundColor: Colors.lightGreen[400],
                            child: Icon(Icons.add,
                            color:Colors.black),
                            ),
                        ),
                      ],)
                    ],
                  ),
                ),
                SizedBox(width: 10,),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                   height: 70,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value){
                        setState(() {
                                tax=value;
                                                });
                      },
                      decoration: InputDecoration(
                        border:OutlineInputBorder(borderRadius:BorderRadius.circular(15)),
                        labelText: "Tax in %",
                        labelStyle:TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 22 )
                       ),
                    ),
                  ),
                )
              ],),
              SizedBox(height: 20,),
              Row(
                children: [
                  buildbutton("1"),
                  buildbutton("2"),
                  buildbutton("3"),
                ],
              ),
              Row(
                children: [
                  buildbutton("4"),
                  buildbutton("5"),
                  buildbutton("6"),
                ],
              ),
              Row(
                children: [
                  buildbutton("7"),
                  buildbutton("8"),
                  buildbutton("9"),
                ],
              ),
              Row(
                children: [
                  buildbutton("."),
                  buildbutton("0"),
                  buildbutton("Clear"),
                ],
              ),
              SizedBox(height: 10,),
              TextButton(
                style:TextButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed:() =>
                  Navigator.push(context, MaterialPageRoute(builder: ( context) => Results(total,tax,people,tip)))
              , child:Center(
                child: Text('Split Bill',
                          style:TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 22,color: Colors.black),),
              ), )
            ],
          ),
        ),
    );
  }
}