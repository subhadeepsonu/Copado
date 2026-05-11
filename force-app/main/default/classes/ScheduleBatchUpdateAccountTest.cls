@isTest
private class ScheduleBatchUpdateAccountTest {

    @TestSetup
    static void makeData() {
        List<Account> accs = TestDataFactory.makeAccountsBatch(5);
        insert accs;
    }

    @isTest
    static void testScheduleRunsBatch() {
        Test.startTest();

       SchduleBatchUpdateAccount  scheduler  = new SchduleBatchUpdateAccount();
       scheduler.execute(null);

        Test.stopTest();

        List<Account> updatedAccounts = [
            SELECT Id, Rating
            FROM Account
            WHERE Rating = 'Hot'
        ];

        System.assertEquals(5, updatedAccounts.size());
    }
}