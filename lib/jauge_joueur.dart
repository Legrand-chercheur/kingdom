import 'package:flutter/material.dart';

class JaugePVPM extends StatelessWidget {
  final int pv;
  final int pvInitial;
  final int pm;
  final int pmInitial;

  JaugePVPM({required this.pv, required this.pvInitial, required this.pm, required this.pmInitial});

  @override
  Widget build(BuildContext context) {
    double pvRatio = pv / pvInitial;
    double pmRatio = pm / pmInitial;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('PV', style: TextStyle(fontSize: 12),),
            SizedBox(width: 90,),
            Text('${pv}', style: TextStyle(fontSize: 12),),
          ],
        ),
        Container(
          width: 130,
          height: 8,
          child: LinearProgressIndicator(
            value: pvRatio,
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
          ),
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Text('PM', style: TextStyle(fontSize: 12),),
            SizedBox(width: 90,),
            Align(
              alignment: Alignment.centerLeft,
                child: Text('${pm}', style: TextStyle(fontSize: 12),)
            ),
          ],
        ),
        Container(
          width: 130,
          height: 8,
          child: LinearProgressIndicator(
            value: pmRatio,
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ),
      ],
    );
  }
}
