import 'package:flutter/material.dart';
import 'package:moodly/core/extensions/context_extensions.dart';
import 'package:moodly/core/functions/error_dialog.dart';
import 'package:moodly/core/routing/routes.dart';
import 'package:moodly/features/Community/data/services/audio_player_service.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/errors/audio_exceptions.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../home/presentation/widgets/shared/back_button_appbar.dart';
import '../../domain/audio_entity.dart';
import '../widgets/audio/audio_progress_bar.dart';
import '../widgets/audio/player_controls.dart';
import '../widgets/audio/audio_info.dart';

class AudioView extends StatefulWidget {
  final AudioEntity audioEntity;

  const AudioView({super.key, required this.audioEntity});

  @override
  State<AudioView> createState() => _AudioViewState();
}

class _AudioViewState extends State<AudioView> {
  late final AudioPlayerService _audioService;

  @override
  void initState() {
    _audioService = getIt<AudioPlayerService>();
    _init();
    super.initState();
  }

  Future<void> _init() async {
    try {
      await _audioService.init(widget.audioEntity.audioUrl);
    } on AudioLoadException catch (e) {
      if (!mounted) return;
      errorDialog(context: context, message: e.message);
    } on AudioSessionException catch (e) {
      if (!mounted) return;
      errorDialog(
        context: context,
        message: e.message,
        onPressed: () => context.pushAndRemoveUntil(Routes.meditationsView),
      );
    } catch (_) {
      if (!mounted) return;
      errorDialog(context: context, message: "Unexpected error occurred");
    }
  }

  @override
  void dispose() {
    _audioService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackButtonAppbar(title: "Now playing"),
      body: AudioViewBody(widget: widget, audioService: _audioService),
    );
  }
}

class AudioViewBody extends StatelessWidget {
  const AudioViewBody({
    super.key,
    required this.widget,
    required AudioPlayerService audioService,
  }) : _audioService = audioService;

  final AudioView widget;
  final AudioPlayerService _audioService;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: kAppSectionSpacing),
              AudioInfo(audioEntity: widget.audioEntity),
              const SizedBox(height: 30),
              AudioProgressBar(player: _audioService.player),
              const SizedBox(height: 10),
              PlayerControls(player: _audioService.player),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
