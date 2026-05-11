@isTest
private class BatchUpdateAccountTest {
    @TestSetup
    static void makeData(){
        List<Account> accs = TestDataFactory.makeAccountsBatch(5);
        insert accs;
    }

    @isTest
    static void TestAccountBatch() {
       Test.startTest();
       Database.executeBatch(new BatchUpdateAccount(), 200);
       Test.stopTest();
       List<Account> accs = [SELECT Id, Name FROM Account WHERE Rating='Hot' ];
       System.debug(accs.size());
       System.assertEquals(5, accs.size(), 'Should have 5 accounts after batch');
    }
}