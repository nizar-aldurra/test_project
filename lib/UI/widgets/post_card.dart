import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/post.dart';

Widget PostCard(List<Post> posts, int index) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'User Name',
                            style: TextStyle(fontSize: 22),
                          ),
                          // Text(
                          //   posts[index].publishedAt?.timeZoneName == null
                          //       ? 'null'
                          //       : DateFormat('dd/MM/yyyy  HH:mm:a')
                          //           .format(posts[index].publishedAt!),
                          //   style: const TextStyle(fontSize: 18),
                          // ),
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              children: [
                                posts[index].content != null &&
                                    posts[index].content!.isNotEmpty ? Text(posts[index].content!):const SizedBox(),
                                posts[index].media != null &&
                                        posts[index].media!.isNotEmpty
                                    ?
                                    // GridView.builder(
                                    //         shrinkWrap: true,
                                    //         physics: const NeverScrollableScrollPhysics(),
                                    //         gridDelegate:
                                    //             const SliverGridDelegateWithFixedCrossAxisCount(
                                    //           crossAxisCount: 3,
                                    //           crossAxisSpacing: 4,
                                    //           mainAxisSpacing: 4,
                                    //         ),
                                    //         itemCount: posts[index].media?.length,
                                    //         itemBuilder:
                                    //             (BuildContext context, int index1) {
                                    //           GestureDetector(
                                    //             onTap: () {},
                                    //             child: CachedNetworkImage(
                                    //               imageUrl: posts[index]
                                    //                   .media![index1]
                                    //                   .srcUrl,
                                    //               fit: BoxFit.cover,
                                    //               placeholder: (context, url) =>
                                    //                   Container(
                                    //                 color: Colors.grey[300],
                                    //               ),
                                    //               errorWidget:
                                    //                   (context, url, error) =>
                                    //                       const Icon(Icons.error),
                                    //             ),
                                    //           );
                                    //           return null;
                                    //         },
                                    //       )
                                    Column(
                                        children: [
                                          for (var post in posts[index].media!)
                                            CachedNetworkImage(
                                              imageUrl: post.srcUrl,
                                              fit: BoxFit.cover,
                                              placeholder: (context, url) =>
                                                  Container(
                                                    color: Colors.grey[300],
                                                  ),
                                              errorWidget:
                                                  (context, url, error) =>
                                              const Icon(Icons.error),
                                            ),
                                        ],
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14.0, right: 14),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${posts[index].interactionsNum} likes'),
                      Text('${posts[index].commentsNum} comments'),
                      Text('${posts[index].shareNum} shares'),
                    ],
                  ),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Icon(Icons.thumb_up_alt_outlined),
                          SizedBox(
                            width: 8,
                          ),
                          Text('Like'),
                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    TextButton(
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Icon(Icons.comment),
                          SizedBox(
                            width: 8,
                          ),
                          Text('Comment')
                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    TextButton(
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Icon(Icons.send),
                          SizedBox(
                            width: 8,
                          ),
                          Text('Share')
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
