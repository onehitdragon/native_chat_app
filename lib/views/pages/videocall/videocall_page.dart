import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:native_chat_app/state/video_call_state.dart';
import 'package:native_chat_app/views/pages/home/components/avatar.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:native_chat_app/views/pages/videocall/components/timer.dart';
import 'package:peerdart/peerdart.dart';
import 'package:provider/provider.dart';

class VideoCallPage extends StatefulWidget{
  const VideoCallPage({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return VideoCallPageState();
  }
}

class VideoCallPageState extends State<VideoCallPage>{
  final RTCVideoRenderer _localRender = RTCVideoRenderer();
  final RTCVideoRenderer _remoteRender = RTCVideoRenderer();

  void onStream(MediaConnection conn){
    conn.on("stream").listen(
      (event) {
        _remoteRender.srcObject = event;

        _localRender.initialize()
        .then((value) {
          return _remoteRender.initialize();
        })
        .then((value) {
          setState(() {});
        });
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    VideoCallState videoCallState = Provider.of<VideoCallState>(context);
    Peer? peer = videoCallState.peer;
    String? remotePeerId = videoCallState.remotePeerId;

    if(remotePeerId == null || peer == null){
      Future.delayed(Duration.zero, () {
        context.go("/");
      });
      return Container();
    }

    if(_localRender.srcObject == null){
      navigator.mediaDevices.getUserMedia({
        "video": true,
        "audio": false
      })
      .then((mediaStream) {
        _localRender.srcObject = mediaStream;
        if(videoCallState.isCaller){
          final conn = peer.call(remotePeerId, mediaStream);
          onStream(conn);
        }
        else{
          peer.on<MediaConnection>("call").listen((conn) {
            conn.answer(mediaStream);
            onStream(conn);
          });
        }
      })
      .catchError((err){
        debugPrint(err);
      });
    }

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg.gif"),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          children: [
            // header
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white,)
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Avatar(),
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        child: const Text(
                          "...",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ),
                      const Timer()
                    ]
                  )
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert, color: Colors.white,)
                )
              ]
            ),
            // body
            Expanded(
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: _remoteRender.srcObject != null ?
                      RTCVideoView(_remoteRender, objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover)
                      :
                      Container(
                        color: Colors.white,
                      )
                    )
                  ),
                  Positioned(
                    width: 100,
                    height: 150,
                    bottom: 20,
                    right: 10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: _localRender.srcObject != null ?
                      RTCVideoView(_localRender, objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover)
                      :
                      Container(
                        color: Colors.white,
                      )
                    )
                  )
                ]
              )
            ),
            // footer
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: const Color.fromARGB(120, 0, 0, 0),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.camera_alt_outlined, color: Colors.white)
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mic, color: Colors.white)
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(100)
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.call_end, color: Colors.white)
                    )
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.volume_up_rounded, color: Colors.white)
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.view_quilt_sharp, color: Colors.white)
                  )
                ]
              )
            )
          ]
        )
      )
    );
  }
}