// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:wave/config.dart';
// import 'package:wave/wave.dart';

// class AudioWaveformWidget extends StatefulWidget {
//   final String audioUrl;

//   const AudioWaveformWidget({Key? key, required this.audioUrl}) : super(key: key);

//   @override
//   AudioWaveformWidgetState createState() => AudioWaveformWidgetState();
// }

// class _AudioWaveformWidgetState extends State<AudioWaveformWidget> {
//   late AudioPlayer audioPlayer;

//   @override
//   void initState() {
//     super.initState();
//     audioPlayer = AudioPlayer();
//   }

//   @override
//   void dispose() {
//     audioPlayer.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [


//         WaveWidget(
//     config: CustomConfig(
//         colors: colors,
//         durations: _durations,
//         heightPercentages: _heightPercentages,
//     ),
//     backgroundColor: _backgroundColor,
//     size: Size(double.infinity, double.infinity),
//     waveAmplitude: 0,
// ),
//         WaveWidget(
//           size: Size(300, 100),
          
//           config:Config(
//             gradients: [
//               [Colors.red, Color(0xEEF44336)],
//               [Colors.red[800]!, Color(0x77E57373)],
//               [Colors.orange, Color(0x66FF9800)],
//               [Colors.yellow, Color(0x55FFEB3B)]
//             ],
//             durations: [35000, 19440, 10800, 6000],
//             heightPercentages: [0.20, 0.25, 0.30, 0.35],
//           ),
//           waveData: WaveData.fromURL(widget.audioUrl),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             audioPlayer.play('');
//           },
//           child: Text('Play'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             audioPlayer.pause();
//           },
//           child: Text('Pause'),
//         ),
//       ],
//     );
//   }
// }