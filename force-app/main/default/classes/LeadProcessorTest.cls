@isTest
private class LeadProcessorTest {
    @TestSetup
    static void makeData(){
        List<Lead> lds = TestDataFactory.makeLeads(1);
        insert lds;
    }
    @IsTest
    static void UpdateLeadTest(){
        Test.startTest();        
        Database.executeBatch(new LeadProcessor(),200);
        Test.stopTest();
        List<Lead> lds = [SELECT Id,Status,LeadSource FROM Lead WHERE LastName='Test 0'  LIMIT 1];
        System.Assert.areEqual('Dreamforce',lds[0].LeadSource,'Lead  Spurce should be Dreamforce');
    }
}