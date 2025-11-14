enum AppFlavor { free, paid }

class FlavorConfig {
  const FlavorConfig._();

  static AppFlavor appFlavor = AppFlavor.free;

  static bool get isFree => appFlavor == AppFlavor.free;
  static bool get isPaid => appFlavor == AppFlavor.paid;
}
