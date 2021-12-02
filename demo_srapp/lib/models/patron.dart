enum PatronTier { gold1, apex }

class Patron {
  final String pid;
  final String name;
  final PatronTier tier;
  final String tierExpDate;

  Patron(
      {required this.pid,
      required this.name,
      required this.tier,
      required this.tierExpDate});
}
