@isTest
private class AddPrimaryContactTest {
    @TestSetup
    static void makeData(){

        List<Account> accs2 = TestDataFactory.makeAccounts(50,'New York');
        insert accs2;
        Contact c = new Contact(LastName='Test');
        insert c;        
    }

    @IsTest
    public static void testAddPrimaryContact(){
        Test.startTest();
        List<Contact> cs = [SELECT Id,LastName FROM Contact WHERE LastName='Test'];       
        System.enqueueJob(new AddPrimaryContact(cs[0],'New York'));
        Test.stopTest();
        List<Contact> cons= [SELECT Id FROM Contact WHERE Account.BillingState='New York'];
        System.Assert.areEqual(50,cons.size());
    }
}