import 'package:flutter/foundation.dart';
import 'package:peerdart/peerdart.dart';

class VideoCallState extends ChangeNotifier{
  Peer? peer;
  String? remotePeerId;
  bool isCaller = false;

  void initPeer(Function() onInit){
    var peer = this.peer;
    peer = Peer(
      options: PeerOptions(
        host: "localhost",
        port: 9000,
        secure: false,
        // config: {
        //   "iceServers": [
        //     {
        //       "urls": "stun:stun.l.google.com:19302"
        //     }
        //   ]
        // }
      )
    );

    peer.on("open").listen((event) {
      debugPrint("connect to peer...");
      onInit();
    });

    this.peer = peer;
  }
  
  void detroy(){
    final peer = this.peer;
    if(peer != null){
      debugPrint("disconnect to peer...");
      peer.dispose();
    }
  }

  void setRemotePeerId(String remotePeerId){
    this.remotePeerId = remotePeerId;
    notifyListeners();
  }

  void setIsCaller(isCaller){
    this.isCaller = isCaller;
  }
}