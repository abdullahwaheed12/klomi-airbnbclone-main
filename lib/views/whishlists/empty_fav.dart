import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EmptyWishlists extends StatefulWidget {
  const EmptyWishlists({super.key});

  @override
  State<EmptyWishlists> createState() => _EmptyWishlistsState();
}

class _EmptyWishlistsState extends State<EmptyWishlists> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create your first Wishlist'.tr(),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
                'As you search, tap the heart icon to save your favourite places to stay or things to do to a wishlists.'
                    .tr())
          ],
        ),
      ),
    );
  }
}
