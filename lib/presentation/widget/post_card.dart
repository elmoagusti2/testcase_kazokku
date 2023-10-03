

import 'package:flutter/material.dart';
import 'package:kazokku/models/post/data_post.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostsCard extends StatelessWidget {
  final DataPost dataPost;
  const PostsCard({
    Key? key,
    required this.dataPost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.w),
      width: MediaQuery.of(context).size.width,
      height: 300.h,
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                '${dataPost.image}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            children: [
              Wrap(
                children: [
                  for (var item in dataPost.tags!)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Chip(label: Text(item)),
                    )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('${dataPost.likes}'),
                const Icon(Icons.favorite_border)
              ],
            ),
          )
        ],
      ),
    );
  }
}
