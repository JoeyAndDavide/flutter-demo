class Patron {
  final String patronID;
  final String patronName;
  final String currentTier;
  final String currentTierExpDate;

  Patron(
      {required this.patronID,
      required this.patronName,
      required this.currentTier,
      required this.currentTierExpDate});
}
