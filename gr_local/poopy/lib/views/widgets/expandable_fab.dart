import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
class ExpandableFab extends StatefulWidget {
  const ExpandableFab({
    super.key,
    this.initialOpen,
    required this.distance,
    required this.children,
  });

  final bool? initialOpen;
  final double distance;
  final List<Widget> children;

  @override
  _ExpandableFabState createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;
  bool _open = false;

  @override
  void initState() {
    super.initState();
    _open = widget.initialOpen ?? false;
    _controller = AnimationController(
      value: _open ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          _buildTapToCloseFab(),
          ..._buildExpandingActionButtons(),
          _buildTapToOpenFab(),
        ],
      ),
    );
  }

  Widget _buildTapToCloseFab() {
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return SizedBox(
      width: contextWidth * 2,
      height: contextWidth * 2,
      child: Padding(
        padding: EdgeInsets.all(contextWidth * 0.4),
        child: Material(
          shape: const CircleBorder(),
          color: CupertinoColors.systemGrey6,
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          child: InkWell(
            onTap: _toggle,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.close,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildExpandingActionButtons() {
    final children = <Widget>[];
    final count = widget.children.length;
    final step = 90.0 / (count - 1);
    for (var i = 0, angleInDegrees = 0.0;
    i < count;
    i++, angleInDegrees += step) {
      children.add(
        _ExpandingActionButton(
          directionInDegrees: angleInDegrees,
          maxDistance: widget.distance,
          progress: _expandAnimation,
          child: widget.children[i],
        ),
      );
    }
    return children;
  }

  Widget _buildTapToOpenFab() {
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return IgnorePointer(
      ignoring: _open,
      child: AnimatedContainer(
        transformAlignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          _open ? 0.7 : 1.0,
          _open ? 0.7 : 1.0,
          1.0,
        ),
        duration: const Duration(milliseconds: 250),
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
        child: AnimatedOpacity(
          opacity: _open ? 0.0 : 1.0,
          curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
          duration: const Duration(milliseconds: 250),
          child: SizedBox(
            width: contextWidth * 2,
            height: contextWidth * 2,
            child: FloatingActionButton(
                onPressed: _toggle,
                shape: CircleBorder(),
                backgroundColor: Color(0xFFF39931),
                child: Icon(
                  Icons.menu,
                  size: contextWidth * 0.8,
                  color: Colors.white,
                ),
              ),
          ),
        ),
      ),
    );
  }
}

@immutable
class _ExpandingActionButton extends StatelessWidget {
  const _ExpandingActionButton({
    required this.directionInDegrees,
    required this.maxDistance,
    required this.progress,
    required this.child,
  });

  final double directionInDegrees;
  final double maxDistance;
  final Animation<double> progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        final offset = Offset.fromDirection(
          directionInDegrees * (math.pi / 180.0),
          progress.value * maxDistance,
        );
        return Positioned(
          right: 4.0 + offset.dx,
          bottom: 4.0 + offset.dy,
          child: Transform.rotate(
            angle: (1.0 - progress.value) * math.pi / 2,
            child: FadeTransition(
              opacity: progress,
              child: child!,
            ),
          ),
        );
      },
      child: child,
    );
  }
}

class GlobalExpandableFab extends StatefulWidget {
  const GlobalExpandableFab({super.key});

  @override
  _GlobalExpandableFabState createState() => _GlobalExpandableFabState();
}

class _GlobalExpandableFabState extends State<GlobalExpandableFab> {
  @override
  Widget build(BuildContext context) {
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return ExpandableFab(
      distance: contextWidth * 2.5,
      children: [
        ActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/calendar');
          },
          icon: const Icon(Icons.calendar_today),
          iconColor: Color(0xFFEB5787),
        ),
        ActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/camera');
          },
          icon: const Icon(Icons.camera_alt),
          iconColor: Color(0xFF393845),
        ),
        ActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/mypage');
          },
          icon: const Icon(Icons.person),
          iconColor: Color(0xFF64A2F3),
        ),
      ],
    );
  }
}

@immutable
class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    this.onPressed,
    required this.icon,
    required this.iconColor,
  });

  final VoidCallback? onPressed;
  final Widget icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: iconColor,
      elevation: 4,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        iconSize: contextWidth * 0.7,
        padding: EdgeInsets.all(contextWidth * 0.4),
        color: Colors.white,
      ),
    );
  }
}
