@isTest
private class TaskUtilTests {
    @isTest
    public static void testGetTaskPriorityHigh(){
        Test.startTest();
       
        String priority = TaskUtil.getTaskPriority('CA');
        Test.stopTest();
        System.Assert.areEqual('High',priority);

    }

    @isTest 
    public static void testGetTaskPriorityNormal(){
        Test.startTest();
        String priority = TaskUtil.getTaskPriority('IN');
        Test.stopTest();
        System.Assert.areEqual('Normal',priority);
    }
    
}