import 'package:flutter/material.dart';
import 'package:follow_app/constants.dart';
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
          const SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(height: 110),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 16,
                        child: Icon(Icons.person, size: 18),
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        'sabrina_girl',
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.verified,
                        size: 15,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 6),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Follow',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 6),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'FOLLOW is beautiful and fast 💙❤💛 ..',
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.music_note,
                        size: 15,
                        color: AppColors.white,
                      ),
                      Text(
                        'Original Audio - some music track--',
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
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
                      size: 30,
                      color: Colors.red,
                    ),
                  ),
                  5.verticalSpace(),
                  const Text(
                    '100',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  10.verticalSpace(),
                  InkWell(
                    onTap: (() {}),
                    child: const Icon(
                      Icons.comment,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  5.verticalSpace(),
                  const Text(
                    '43',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  10.verticalSpace(),
                  InkWell(
                    onTap: (() {}),
                    child: const Icon(
                      Icons.reply,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  5.verticalSpace(),
                  const Text(
                    '12',
                    style: TextStyle(
                      fontSize: 16,
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
