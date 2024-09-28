import 'package:ft_task/package/config_packages.dart';

extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
        <K, List<E>>{},
        (Map<K, List<E>> map, E element) => map
          ..putIfAbsent(keyFunction(element), () => <E>[]).add(
            element,
          ),
      );
}

CachedNetworkImage getImageView({required String finalUrl, double height = 40, double width = 40, fit = BoxFit.none, Decoration? shape, Color? color}) {
  return CachedNetworkImage(
    imageUrl: finalUrl,
    fit: fit,
    height: height,
    width: width,
    placeholder: (context, url) => Container(
      margin: const EdgeInsets.all(10),
      height: height,
      width: width,
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: Theme.of(Get.context!).primaryColor,
        ),
      ),
    ),
    errorWidget: (context, url, error) => SizedBox(
      height: height,
      width: width,
      child: const Icon(Icons.error),
    ),
  );
}
