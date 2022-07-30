import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shimmer/shimmer.dart';

class WallLoadingGrid extends StatelessWidget {
  const WallLoadingGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Shimmer.fromColors(
           baseColor: Colors.grey,
                              highlightColor: Colors.grey,
                         period: Duration(seconds: 2),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            crossAxisCount: MediaQuery.of(context).size.width > 500 ? 3 : 2,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return GestureDetector(
              onLongPress: () {},
              onTap: () {
               
              },
              child: Container(
                margin: EdgeInsets.all(2),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1640142823298-5efa4b79e076?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80'),
                        fit: BoxFit.fill,
                        opacity: 1)),
        
              ),
            );
          }),
      );
  }
}