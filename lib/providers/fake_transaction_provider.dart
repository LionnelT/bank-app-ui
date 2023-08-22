import 'package:bank_app_ui/widgets/transaction_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fakeTransactionsProvider = Provider((ref) {
  return const [
    TransactionItemModel(
      title: 'Chicken Inn',
      subtitle: 'Harare, Zimbabwe',
      amount: '-\$2,7',
      date: '18.08.2023 19:00',
    ),
    TransactionItemModel(
      title: 'Museyamwa Supermarket',
      subtitle: 'Harare, Zimbabwe',
      amount: '-\$13',
      date: '15.08.2023 13:34',
    ),
    TransactionItemModel(
      title: 'From Tawanda Moyo',
      subtitle: 'Code: 12345678',
      amount: '+\$250',
      date: '13.08.2023 08:08',
    ),
  ];
});
