@isTest
private class DemoTestingTest {
    @TestSetup
    static void makeData(){
        List<Case> cases = TestDataFactory.makeCases(1);
        insert cases;
    }
    @isTest
    static void MultiplyTest(){
        Test.startTest();
        DemoTesting dt = new DemoTesting();
        Integer actual = dt.multiply(2,3);
        Test.stopTest();
        System.Assert.areEqual(6,actual,'come on multiplication can not be wrong');
    }
     
    @isTest
    static void UpdateCaseTest(){
        Test.startTest();
        List<Case> cases = [SELECT Id FROM Case WHERE Subject='Test data case 0' LIMIT 1];
        DemoTesting dt = new DemoTesting();
        dt.updateCase(cases[0]);
        Test.stopTest();   
        Assert.areEqual('New', cases[0].Status,'Case status should be new');

    }
}  