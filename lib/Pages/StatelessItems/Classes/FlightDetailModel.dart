class FlightDetailModel {
  final itemList = [
    FlightDetailItemData(
        plus: "Saver",
        valueType: 'Best Price',
        amount: '4,412',
        seat: 'Chargeable',
        meal: 'Chargeable',
        changeFee: 'Up to INR 3250',
        cancellationFee: 'Up to INR 3500',
        checkInBeg: '15 KG',
        handBag: '7 KG'),
    FlightDetailItemData(
        plus: "FLEXI PLUS",
        valueType: 'Best Value',
        amount: '4,412',
        seat: 'Chargeable',
        meal: 'Chargeable',
        changeFee: 'Up to INR 3250',
        cancellationFee: 'Up to INR 3500',
        checkInBeg: '15 KG',
        handBag: '7 KG'),
    FlightDetailItemData(
        plus: "SUPER 6E",
        valueType: 'Super Value',
        amount: '4,412',
        seat: 'Chargeable',
        meal: 'Chargeable',
        changeFee: 'Up to INR 3250',
        cancellationFee: 'Up to INR 3500',
        checkInBeg: '15 KG',
        handBag: '7 KG'),
  ];
}

class FlightDetailItemData {
  String plus;
  String valueType;
  String amount;
  String seat;
  String meal;
  String changeFee;
  String cancellationFee;
  String checkInBeg;
  String handBag;

  FlightDetailItemData({
    required this.plus,
    required this.valueType,
    required this.amount,
    required this.seat,
    required this.meal,
    required this.changeFee,
    required this.cancellationFee,
    required this.checkInBeg,
    required this.handBag,
  });
}
