
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:xvpn/feature/presentation/widgets/common/buttons/custom_back_button.dart';
import 'package:xvpn/feature/presentation/widgets/common/errors/error_widget.dart';
import 'package:xvpn/feature/presentation/widgets/common/loading_widget.dart';
import 'package:xvpn/utils/constants/colors.dart';

abstract class BasePage extends ConsumerStatefulWidget {
  const BasePage({super.key});

  // [ Обязательные свойства для всех страниц ]
  String get routeName;
  String title();

  // [ Опциональные настройки ]
  bool get showAppBar => true;
  bool get showBackButton => true;
  bool get enableLoading => true;
  bool get enableErrorHandling => true;
  bool get safeArea => true;
  ScrollPhysics get scrollPhysics => const ClampingScrollPhysics();

  // [ Свойства appBar ]
  // [ AppBar появляется при прокрутке вверх  ]
  bool get floatingAppBar => false;
  bool get showLearningButton => true;
  bool get pinnedAppBar => false; // [ AppBar остается видимым при прокрутке  ]
  bool get snapAppBar => false; // [ Мгновенное появление AppBar            ]

  @override
  BasePageState createState();
}

abstract class BasePageState<T extends BasePage> extends ConsumerState<T> {
  // [ Общее состояние для всех страниц ]
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _error;
  String? get error => _error;
  bool _isDisposed = false;




  void setLoading(bool loading) {
    if (!_isDisposed && mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!_isDisposed && mounted) {
          setState(() {});
        }
      });
    }
  }

  void setError(String? error) {
    if (!_isDisposed && mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!_isDisposed && mounted) {
          setState(() => _error = error);
        }
      });
    }
  }

  void clearError() {
    if (!_isDisposed && mounted) {
      _error = null;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!_isDisposed && mounted) setState(() {});
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => onPageInit());
  }

  @override
  void dispose() {
    _isDisposed = true;
    onPageDispose();
    super.dispose();
  }

  void safeSetState(VoidCallback fn) {
    if (!_isDisposed && mounted) setState(fn);
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: getBackgroundColor(),
      ),
      child: Scaffold(
        body: _buildBody(),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }

  Widget _buildBody() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
            maxHeight: constraints.maxHeight,
          ),
          child: CustomScrollView(
            physics: widget.scrollPhysics,
            slivers: [
              // SLIVER APP BAR
              if (widget.showAppBar) _buildSliverAppBar(),

              // ОСНОВНОЕ СОДЕРЖИМОЕ
              SliverFillRemaining(
                hasScrollBody: false,
                child: widget.safeArea
                    ? SafeArea(child: _buildContent())
                    : _buildContent(),
              ),
            ],
          ),
        );
      },
    );
  }

  SliverAppBar _buildSliverAppBar() {
    final titleText = widget.title();

    return SliverAppBar(
      centerTitle: true,
      title: Text(
        titleText,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(fontWeight: FontWeight.bold, color: XColors.primary),
      ),
      leading: widget.showBackButton ? customBackButton(context) : null,
      backgroundColor: Colors.transparent,
      elevation: 0,
      floating: widget.floatingAppBar, // Появляется при прокрутке вверх
      pinned: widget.pinnedAppBar, // Остается видимым
      snap: widget.snapAppBar, // Мгновенное появление
      actions: buildAppBarActions(),
      // expandedHeight: 100, // ← Можно настроить высоту при расширении
    );
  }

  Widget _buildContent() {
    if (widget.enableLoading && _isLoading) return getLoadingWidget();
    if (widget.enableErrorHandling && _error != null) return getErrorWidget();
    return buildContent();
  }

  Widget getLoadingWidget() => const XLoadingWidget();
  Widget getErrorWidget() => XErrorWidget(message: _error!, close: () {});
  Widget customBackButton(BuildContext context) => const CustomBackButton();

  void onPageInit() {}
  void onPageDispose() {}
  void onPageRefresh() {}
  void refreshPage() => setState(() {});
  Widget buildContent();
  double getAppBarElevation() => 4.0;
  List<Widget>? buildAppBarActions() => null;
  Color getBackgroundColor() => Theme.of(context).scaffoldBackgroundColor;
  Color getAppBarColor() =>
      Theme.of(context).appBarTheme.backgroundColor ?? Colors.blue;
}
