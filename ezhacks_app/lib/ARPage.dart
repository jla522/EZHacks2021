import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'dart:typed_data';

class ARCore extends StatefulWidget {
  ARCore({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ARCoreState createState() => _ARCoreState();
}

class _ARCoreState extends State<ARCore> {
  ArCoreController arCoreController;

  _onArCoreViewCreated(ArCoreController _arCoreController) {
    arCoreController = _arCoreController;

    _addSphere(arCoreController, 1);
    _addSphere(arCoreController, -1);
    _addSphere2(arCoreController);
    _addTwitter(arCoreController, 'assets/images/twitter.png');
    _addTweet(arCoreController, 'assets/images/1.png', 0, 5);
    _addTweet(arCoreController, 'assets/images/2.png', 0, 1.5);
    _addTweet(arCoreController, 'assets/images/3.png', 0, -2);
    _addTweet(arCoreController, 'assets/images/4.png', 6, -2);
    _addTweet(arCoreController, 'assets/images/5.png', 6, 1.5);
  }

  _addSphere(ArCoreController _arCoreController, double loc) {
    final material = ArCoreMaterial(
      color: Color(0xFF1DA1F2),
    );
    final sphere = ArCoreSphere(
      materials: [material],
      radius: 0.3,
    );
    final node = ArCoreNode(
      shape: sphere,
      position: vector.Vector3(loc * 2, (loc * 1.6) - 0.5, -5),
    );

    _arCoreController.addArCoreNode(node);
  }

  _addSphere2(ArCoreController _arCoreController) {
    final material = ArCoreMaterial(
      color: Color(0xFF1DA1F2),
    );
    final sphere = ArCoreSphere(
      materials: [material],
      radius: 0.3,
    );
    final node = ArCoreNode(
      shape: sphere,
      position: vector.Vector3(0.3, 5.5, -5),
    );

    _arCoreController.addArCoreNode(node);
  }

  void _addTwitter(ArCoreController _arCoreController, String address) async {
    final ByteData texture = await rootBundle.load(address);
    final material = ArCoreMaterial(
      color: Colors.white,
      metallic: 1,
      textureBytes: texture.buffer.asUint8List(),
    );
    final cube = ArCoreCube(
        materials: [material],
        size: vector.Vector3(1.5, 1.5, 0.05)); // (width,height,depth)
    final node = ArCoreNode(
      shape: cube,
      position: vector.Vector3(-1.5, 8, -8), // (width,height,depth)
    );

    _arCoreController.addArCoreNode(node);
  }

  void _addTweet(ArCoreController _arCoreController, String address,
      double locx, double locy) async {
    final ByteData texture = await rootBundle.load(address);
    final material = ArCoreMaterial(
      color: Colors.white,
      metallic: 1,
      textureBytes: texture.buffer.asUint8List(),
    );
    final cube = ArCoreCube(
        materials: [material],
        size: vector.Vector3(5, 3, 0.3)); // (width,height,depth)
    final node = ArCoreNode(
      shape: cube,
      position: vector.Vector3(locx, locy, -8), // (width,height,depth)
    );

    _arCoreController.addArCoreNode(node);
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        title: const Text('Twitter'),
        backgroundColor: Color(0xFF2E6175),
      ),
      body: ArCoreView(
        onArCoreViewCreated: _onArCoreViewCreated,
        enableTapRecognizer: true,
      ),
    );
  }
}
