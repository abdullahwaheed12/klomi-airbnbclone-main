import 'package:flutter/material.dart';

class ExploreDetailAnimitiesListTile extends StatelessWidget {
  const ExploreDetailAnimitiesListTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap,
      required this.isSelected});
  final String title;
  final IconData icon;
  final bool isSelected;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                decoration: isSelected
                    ? TextDecoration.none
                    : TextDecoration.lineThrough),
          ),
          const Spacer(),
          Icon(
            icon,
            size: 25,
            color: isSelected ? Colors.black : Colors.grey,
          ),
        ],
      ),
    );
  }
}
