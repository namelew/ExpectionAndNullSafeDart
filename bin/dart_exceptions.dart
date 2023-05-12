import 'dart:math';

import 'controllers/bank_controller.dart';
import 'exceptions/bank_controller_exceptions.dart';
import 'models/account.dart';

void testingNullSafety() {
  Account myAccount = Account(name: "Ricarth", balance: 200, isAuthenticated: true);

  Random rng = Random();
  int randomNumber = rng.nextInt(10);

  if (randomNumber <= 5) {
    myAccount.createdAt = DateTime.now();
  }
  if (myAccount.createdAt != null) {
      print(myAccount.createdAt!.day); // Nesse caso, não dá pra usar o ?, tem que testar se propriedade não é nula e usar o !
  } else {
    print("Propriedade nula");
  }
}

void main() {
  // Criando o banco
  testingNullSafety();
  BankController bankController = BankController();

  // Adicionando contas
  bankController.addAccount(
      id: "Ricarth",
      account:
          Account(name: "Ricarth Lima", balance: 400, isAuthenticated: true));

  bankController.addAccount(
      id: "Kako",
      account:
          Account(name: "Caio Couto", balance: 600, isAuthenticated: true));

  // Fazendo transferência
  try{
    bool result = bankController.makeTransfer(
      idSender: "Kako", idReceiver: "Ricarth", amount: 700);
    // Observando resultado
    print(result);
  } on SenderIdInvalidException catch (e) {
    print(e);
    print("O id ${e.idSender} do remetente não é um id válido");
  } on ReceiverIdInvalidException catch (e) {
    print(e);
    print("O id ${e.idReceiver} do destinatário não é um id válido");
  } on SenderNotAuthenticatedException catch (e) {
    print(e);
    print("O usuário remetente de id ${e.idSender} não está autenticado");
  } on ReceiverNotAuthenticatedException catch (e){
    print(e);
    print("O usuário destinatário de id ${e.idReceiver} não está autenticado");
  } on SenderInsufficientFundsException catch(e) {
    print(e);
    print("O usuário de id ${e.idSender} tentou enviar ${e.amount} sendo que na sua conta em apenas ${e.balance}");
  }
}
