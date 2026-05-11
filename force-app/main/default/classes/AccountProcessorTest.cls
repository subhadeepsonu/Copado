@isTest
private class AccountProcessorTest {
    @IsTest
    public static void testProcessAccounts(){
        Test.startTest();
        List<Account> accs = new List<Account>{
            new Account(Name='Test Account 1'),
            new Account(Name='Test Account 2')
        };
        insert accs;
        AccountProcessor.countContacts(new List<Id>{accs[0].Id});
        Test.stopTest();
        Account updatedAcc = [
            SELECT Number_Of_Contacts__c
            FROM Account
            WHERE Id = :accs[0].Id
        ];
        System.Assert.areEqual(0,updatedAcc.Number_Of_Contacts__c);
    }
}