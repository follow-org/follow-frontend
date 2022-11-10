import 'package:flutter/material.dart';
import 'package:follow_app/helper/util_extensions.dart';

import '../views/widgets/circle_animation.dart';

class OptionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: 110),
                  Row(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.person, size: 18),
                        radius: 16,
                      ),
                      SizedBox(width: 6),
                      Text('sabrina_girl'),
                      SizedBox(width: 10),
                      Icon(Icons.verified, size: 15),
                      SizedBox(width: 6),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Follow',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 6),
                  Text('FOLLOW is beautiful and fast 💙❤💛 ..'),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.music_note,
                        size: 15,
                      ),
                      Text('Original Audio - some music track--'),
                    ],
                  ),
                ],
              ),
              Column(
                // Likes, Comments, Share, Rotating circle
                children: [
                  InkWell(
                    onTap: (() {}),
                    child: const Icon(
                      Icons.favorite,
                      size: 40,
                      color: Colors.red,
                    ),
                  ),
                  5.verticalSpace(),
                  Text(
                    '1100',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  10.verticalSpace(),
                  InkWell(
                    onTap: (() {}),
                    child: const Icon(
                      Icons.comment,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  5.verticalSpace(),
                  Text(
                    '43',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  10.verticalSpace(),
                  InkWell(
                    onTap: (() {}),
                    child: const Icon(
                      Icons.reply,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  5.verticalSpace(),
                  Text(
                    '12',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  10.verticalSpace(),
                  // CircleAnimation(
                  //   child: Text('None'),
                  // ),
                ],
              ),
              // Column(
              //   children: [
              //     Icon(Icons.favorite_outline),
              //     Text('601k'),
              //     SizedBox(height: 20),
              //     Icon(Icons.comment_rounded),
              //     Text('1123'),
              //     SizedBox(height: 20),
              //     Transform(
              //       transform: Matrix4.rotationZ(5.8),
              //       child: Icon(Icons.send),
              //     ),
              //     SizedBox(height: 50),
              //     Icon(Icons.more_vert),
              //   ],
              // )
            ],
          ),
        ],
      ),
    );
  }
}
