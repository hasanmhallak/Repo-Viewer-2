import 'package:flutter/material.dart';

import '../domain/repo.dart';
import 'custom_avatar.dart';

class RepoTile extends StatelessWidget {
  final Repo _repo;
  const RepoTile(
    this._repo, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomAvatar(
        url: _repo.avatarUrl,
        backgroundColor: Colors.white.withOpacity(0),
      ),
      title: Text(_repo.name),
      subtitle: Text(
        _repo.description,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: SizedBox(
        width: 40,
        child: Column(
          children: [
            const Icon(Icons.star),
            const SizedBox(
              height: 3,
            ),
            Text(
              _repo.starCount,
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
    );
  }
}
