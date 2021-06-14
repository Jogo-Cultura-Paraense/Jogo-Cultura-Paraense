import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class BGM {
  static List<AudioCache> _tracks = List<AudioCache>();
  static int _currentTrack = -1;
  static bool isPlaying = false;

  static _BGMWidgetsBindingObserver _bgmwbo;

  static _BGMWidgetsBindingObserver get widgetsBindingObserver {
    if (_bgmwbo == null) {
      _bgmwbo = _BGMWidgetsBindingObserver();
    }
    return _bgmwbo;
  }

  static Future _update() async {
    if (_currentTrack == -1) {
      return;
    }

    if (isPlaying) {
      await _tracks[_currentTrack].fixedPlayer.resume();
    } else {
      await _tracks[_currentTrack].fixedPlayer.pause();
    }
  }

  static Future<void> add(String filename) async {
    AudioCache newTrack =
        AudioCache(prefix: 'assets/audio/', fixedPlayer: AudioPlayer());
    await newTrack.load(filename);
    await newTrack.fixedPlayer.setReleaseMode(ReleaseMode.LOOP);
    _tracks.add(newTrack);
  }

  static void remove(int trackIndex) async {
    if (trackIndex >= _tracks.length) {
      return;
    }
    if (isPlaying) {
      if (_currentTrack == trackIndex) {
        await stop();
      }
      if (_currentTrack > trackIndex) {
        _currentTrack -= 1;
      }
    }
    _tracks.removeAt(trackIndex);
  }

  static void removeAll() {
    if (isPlaying) {
      stop();
    }
    _tracks.clear();
  }

  static Future play(int trackIndex) async {
    if (_currentTrack == trackIndex) {
      if (isPlaying) {
        return;
      }
      isPlaying = true;
      _update();
      return;
    }

    if (isPlaying) {
      await stop();
    }

    _currentTrack = trackIndex;
    isPlaying = true;
    AudioCache t = _tracks[_currentTrack];
    await t.loop(t.loadedFiles.keys.first);
    _update();
  }

  static Future stop() async {
    await _tracks[_currentTrack].fixedPlayer.stop();
    _currentTrack = -1;
    isPlaying = false;
  }

  static void pause() {
    isPlaying = false;
    _update();
  }

  static void resume() {
    isPlaying = true;
    _update();
  }

  static void attachWidgetBindingListener() {
    WidgetsBinding.instance.addObserver(BGM.widgetsBindingObserver);
  }
}

class _BGMWidgetsBindingObserver extends WidgetsBindingObserver {
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      BGM.resume();
    } else {
      BGM.pause();
    }
  }
}
