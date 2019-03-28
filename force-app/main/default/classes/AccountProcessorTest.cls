@IsTest
public class AccountProcessorTest {
  @IsTest
  private static void testAccountProcessor() {
      Account acc = new Account();
      acc.Name = 'Test Account';
      Insert acc;
      
      Contact cont = new Contact();
      cont.FirstName = 'Gab';
      cont.LastName = 'Ford';
      cont.AccountId = acc.Id;
      Insert cont;
      
      List<Id> accId = new List<Id>();
      accId.add(acc.Id);
      
      Test.startTest();
      	AccountProcessor.countContacts(accId);
      Test.stopTest();
      
      Account ac = [Select Number_of_Contacts__c From Account Where id =: acc.Id];
      System.assertEquals(1, ac.Number_of_Contacts__c, 'No son iguales las cuentas');
    // runs callout and check results
  }
}