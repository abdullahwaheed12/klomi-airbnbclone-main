import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:share_plus/share_plus.dart';

import '../../../models/explore_model.dart';
import '../../../utiles/kyes.dart';

class ImageSliderDetails extends StatefulWidget {
  const ImageSliderDetails({super.key, required this.exploreModel});
  final ExploreModel exploreModel;

  @override
  State<ImageSliderDetails> createState() => _ImageSliderDetailsState();
}

class _ImageSliderDetailsState extends State<ImageSliderDetails> {
  int indexPage = 0;
  var wishedAdList = GetStorage().read(AppKeys.wishListKey) ?? [];

  wishAd() {
    debugPrint('wished ${widget.exploreModel.isFav}');
    wishedAdList.add(widget.exploreModel.adId);
    GetStorage().write(AppKeys.wishListKey, wishedAdList);
    setState(() {});
  }

  unWishAd() {
    debugPrint('unWished ${widget.exploreModel.isFav}');

    wishedAdList.remove(widget.exploreModel.adId);
    GetStorage().write(AppKeys.wishListKey, wishedAdList);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    widget.exploreModel.isFav = wishedAdList.contains(widget.exploreModel.adId);

    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Stack(
        children: [
          PageView.builder(
              onPageChanged: (v) {
                indexPage = v;
                setState(() {});
              },
              itemCount: widget.exploreModel.images.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                NetworkImage(widget.exploreModel.images[index]),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 10,
                      right: 10,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey[100]!,
                                child: const Icon(
                                  Icons.arrow_back_outlined,
                                  color: Colors.black,
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  Share.share('Klomi aribnb app ');
                                },
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.grey[100]!,
                                  child: const Icon(
                                    Icons.upload_outlined,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                  onTap: () {
                                    if (widget.exploreModel.isFav) {
                                      unWishAd();
                                    } else {
                                      wishAd();
                                    }
                                  },
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.grey[100]!,
                                    child: Icon(
                                      widget.exploreModel.isFav
                                          ? Icons.favorite
                                          : Icons.favorite_border_outlined,
                                      color: widget.exploreModel.isFav
                                          ? Colors.red[900]
                                          : Colors.black,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
          Positioned(
            right: 10,
            bottom: 10,
            child: Container(
                padding: const EdgeInsets.all(10.0),
                // width: widget.exploreModel.images.length * 15,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black.withOpacity(0.7)),
                child: Text(
                  '${indexPage + 1} / ${widget.exploreModel.images.length}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'ManropeRegular',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
