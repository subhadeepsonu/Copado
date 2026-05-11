@isTest
private class CarBatchTest {
    @TestSetup
    static void makeData(){
        List<Car__c> cars = TestDataFactory.makeCars(5);
        insert cars;
    }
      @isTest
      public static void CarMethodTest(){
                Test.startTest();
                Database.executeBatch(new CarBatch());
                Test.stopTest();
                List<Car__c> cars = [SELECT Id FROM Car__c WHERE Processed__c=True  ];
                Assert.areEqual(5, cars.size());
      }
}