
@isTest
private class CreatePrimaryContactTest {
    @TestSetup
    static void makeData(){
        List<Account> accs = TestDataFactory.makeAccountsBatch2(10);
        insert accs;
    }
    @isTest
    static void TestPrimaryContactCreationBatch() {
        Test.startTest();
        Database.executeBatch(new CreatePrimaryContact());
        Test.stopTest();
        List<Contact> cs = [SELECT Id FROM Contact];
        Assert.areEqual(10, cs.size());
    }
}