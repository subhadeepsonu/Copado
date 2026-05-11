public with sharing class AccountProcessor {
    @Future()
    public static  void countContacts(List<Id> accIds) {
        List<Account> accs = [SELECT Id, Name, (SELECT Id FROM Contacts) FROM Account WHERE Id IN :accIds];
        List<Account> updateAcc = new List<Account>();
        for(Account acc: accs) {
                Account a =new Account();
                a.Id = acc.Id;
                a.Number_Of_Contacts__c = acc.Contacts.size();
                updateAcc.add(a);
        }
        update updateAcc;
    }
}