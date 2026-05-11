@isTest
private class DailyLeadProcessorTest {
    @TestSetup
    static void makeData(){
        List<Lead> lds = TestDataFactory.makeLeads(200);
        insert lds;
    }
    @isTest
    static void UpdateLeadTest(){
        List<Lead> beforelds = [SELECT Id,Status FROM Lead WHERE LeadSource=NULL];
        Test.startTest();
        String cronExp = '0 0 0 * * ?';
        System.schedule('Test Daily Lead Processor',cronExp,new DailyLeadProcessor());
        Test.stopTest();
        List<Lead> afterlds = [SELECT Id,Status FROM Lead WHERE LeadSource=NULL];
        System.Assert.areEqual(beforelds.size()-200, afterlds.size());
    }
}