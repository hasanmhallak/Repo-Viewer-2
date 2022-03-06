import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingTile extends StatelessWidget {
  const LoadingTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[350]!,
      highlightColor: Colors.grey[200]!,
      child: ListTile(
        leading: const CircleAvatar(),
        title: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 120,
            height: 15,
            color: Colors.grey,
          ),
        ),
        subtitle: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 250,
            height: 10,
            color: Colors.grey,
          ),
        ),
        trailing: SizedBox(
          width: 40,
          child: Column(
            children: [
              const Icon(Icons.star),
              const SizedBox(height: 3),
              Text(
                '',
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
