import 'package:curry_leaf/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  final Function(String)? onSearch;
  final String hintText;
  final bool autofocus;

  const SearchBarWidget({
    super.key,
    this.onSearch,
    this.hintText = 'Search here...',
    this.autofocus = false,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget>
    with SingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isFocused = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.03).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
    if (_isFocused) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppTheme.defaultRadius),
              boxShadow: _isFocused
                  ? [
                      BoxShadow(
                        color: AppTheme.primaryColor.withOpacity(0.15),
                        blurRadius: 12,
                        offset: const Offset(0, 5),
                      ),
                    ]
                  : AppTheme.lightShadow,
            ),
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              autofocus: widget.autofocus,
              onChanged: widget.onSearch,
              cursorColor: AppTheme.primaryColor,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.defaultPadding,
                  vertical: AppTheme.smallPadding * 1.5,
                ),
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: _isFocused ? AppTheme.primaryColor : Colors.grey,
                ),
                suffixIcon: _controller.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.close),
                        color: Colors.grey,
                        onPressed: () {
                          setState(() {
                            _controller.clear();
                            if (widget.onSearch != null) {
                              widget.onSearch!('');
                            }
                          });
                        },
                      )
                    : null,
                hintText: widget.hintText,
                hintStyle: TextStyle(color: Colors.grey[400]),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        );
      },
    );
  }
}
