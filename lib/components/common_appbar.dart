import 'package:ft_task/package/config_packages.dart';
import 'package:ft_task/package/screen_packages.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final Widget? title;
  final Widget? leading;
  final Widget? action;
  final bool automaticallyImplyLeading;
  final bool? centerTitle;
  final TextStyle? textStyle;
  final bool deleteIcon;
  final bool showFilterIcon;
  final double? leadingWidth;
  final Callback? onTap;
  final Function()? onTapAction;
  final Callback? reloadOnTap;
  final PreferredSizeWidget? bottom;

  const CommonAppBar({
    super.key,
    this.bottom,
    this.title,
    this.backgroundColor,
    this.onTap,
    this.leading,
    this.action,
    this.leadingWidth,
    this.centerTitle = true,
    this.reloadOnTap,
    this.showFilterIcon = true,
    this.automaticallyImplyLeading = true,
    this.onTapAction,
    this.deleteIcon = false,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      bottom: bottom,
      leadingWidth: leadingWidth,
      leading: automaticallyImplyLeading
          ? leading ??
              GestureDetector(
                onTap: onTap ??
                    () {
                      Get.back();
                    },
                behavior: HitTestBehavior.translucent,
                child: const Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: AppColor.white,
                  ),
                ),
              )
          : Container(),
      backgroundColor: backgroundColor,
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColor.black, size: 24),
      centerTitle: centerTitle ?? true,
      titleTextStyle: textStyle ?? const TextStyle(color: AppColor.black).normal18w500,
      title: title,
      actions: [
        showFilterIcon
            ? Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 11,
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      bool val = Theme.of(context).brightness == Brightness.dark;
                      Get.changeThemeMode(val == false ? ThemeMode.dark : ThemeMode.light);
                      if (!val) {
                        AppPref().isDark = true;
                      } else {
                        AppPref().isDark = false;
                      }
                    },
                    child: const Center(
                      child: Text(""),
                    ),
                  ),
                ),
              )
            : Container(),
        action ?? Container()
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
