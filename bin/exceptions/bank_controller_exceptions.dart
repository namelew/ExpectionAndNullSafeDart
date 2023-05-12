class SenderException implements Exception {
  final String idSender;
  final String report;
  SenderException(this.idSender, this.report);

  @override
  String toString() {
    return "$report\nID SENDER: $idSender\n";
  }
}

class ReceiverException implements Exception {
  final String idReceiver;
  final String report;
  ReceiverException(this.idReceiver, this.report);

  @override
  String toString() {
    return "$report\nID RECEIVER: $idReceiver\n";
  }
}

class SenderIdInvalidException extends SenderException{
  SenderIdInvalidException({required String idSender}) : super(idSender, "SenderIdInvalidException");
}
class ReceiverIdInvalidException extends ReceiverException{
  ReceiverIdInvalidException({required String idReceiver}) : super (idReceiver, "ReceiverIdInvalidException");
}
class SenderNotAuthenticatedException extends SenderException{
  SenderNotAuthenticatedException({required String idSender}) : super(idSender, "SenderNotAuthenticatedException");
}

class ReceiverNotAuthenticatedException extends ReceiverException{
  ReceiverNotAuthenticatedException({required String idReceiver}) : super(idReceiver, "ReceiverNotAuthenticatedException");
}

class SenderInsufficientFundsException extends SenderException{
  final double balance;
  final double amount;

  SenderInsufficientFundsException({required String idSender, required this.amount, required this.balance}) : super(idSender, "SenderInsufficientFundsException");

  @override
  String toString() {
    return super.toString() + "Sender Balance: $balance\nAmount: $amount\n";
  }
}