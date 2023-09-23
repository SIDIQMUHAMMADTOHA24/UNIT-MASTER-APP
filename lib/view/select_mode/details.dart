// ignore_for_file: public_member_api_docs, sort_constructors_first
class CardMode {
  final String topTitle;
  final List benefit;
  final String buttonText;
  final String requiredPremium;
  CardMode({
    required this.topTitle,
    required this.benefit,
    required this.buttonText,
    required this.requiredPremium,
  });
}

List<CardMode> listDetailsSelectMode = [
  CardMode(
      topTitle: '',
      benefit: ['5','x','Uji Coba'],
      buttonText: 'Gratis',
      requiredPremium: ''),
  CardMode(
      topTitle: 'Akses ke',
      benefit: ['Lebih dari 5x kesempatan','Dark Mode','Akses ke lebih dari 1 konversi'],
      buttonText: 'Premium',
      requiredPremium:
          'Login untuk menikmati fiktur premium')
];
