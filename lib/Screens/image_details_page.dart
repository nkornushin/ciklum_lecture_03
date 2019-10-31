import 'package:flutter/material.dart';

class ImageDetailsPage extends StatelessWidget {

  const ImageDetailsPage({
    Key key,
    @required String assetPath,
    @required String location,
  }) : _assetPath = assetPath, _location = location, super(key: key);

  final String _assetPath;
  final String _location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details'),),
      body: Center(
        child: _location == 'local' ? Image.asset(_assetPath) : Image.network(_assetPath),
      )
    );
  }
}