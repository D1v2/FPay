class RecentMobileModel {
  final recentMobileItem = [
    RecentMobileItem(
        name: "John1",
        number: "6376567190",
        message: "Recharge Of ₹12 Done",
        date: "10:56 AM",
        isSuccess: true),
    RecentMobileItem(
        name: "John2",
        number: "6376567191",
        message: "Recharge Of ₹12 Failed",
        date: "10:57 AM",
        isSuccess: false),
    RecentMobileItem(
        name: "John3",
        number: "6376567192",
        message: "Recharge Of ₹12 Done",
        date: "10:56 AM",
        isSuccess: true),
    RecentMobileItem(
        name: "John3",
        number: "6376567192",
        message: "Recharge Of ₹12 Done",
        date: "10:00 AM",
        isSuccess: true),
    RecentMobileItem(
        name: "John3",
        number: "6376567192",
        message: "Recharge Of ₹12 Done",
        date: "11:56 AM",
        isSuccess: true),
  ];
  Future<List> recentList() async{
    if(recentMobileItem.isNotEmpty){
      return recentMobileItem;
    }
    return [];
  }
}

class RecentMobileItem {
  final String name;
  final String number;
  final String message;
  final String date;
  final bool isSuccess;

  RecentMobileItem(
      {required this.name,
      required this.number,
      required this.message,
      required this.date,
      required this.isSuccess});
}
