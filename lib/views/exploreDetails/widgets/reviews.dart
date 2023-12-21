import 'package:flutter/material.dart';

import '../../../models/explore_model.dart';

class RevieWdiget extends StatefulWidget {
  const RevieWdiget({super.key, required this.exploreModel});
  final ExploreModel exploreModel;

  @override
  State<RevieWdiget> createState() => _RevieWdigetState();
}

class _RevieWdigetState extends State<RevieWdiget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: MediaQuery.of(context).size.width / 2.5,
      child: ListView.builder(
          itemCount: widget.exploreModel.reviews.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(right: 20.0),
              width: MediaQuery.of(context).size.width / 1.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black38, width: 1),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                            widget.exploreModel.reviews[index].image),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.exploreModel.reviews[index].name,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.exploreModel.reviews[index].time
                                .toString()
                                .substring(0, 16),
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.exploreModel.reviews[index].description,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
