@isTest
private class CarTest {
    @isTest
    static void testCarTrigger() {
        List<Car__c> cars = TestDataFactory.makeCars(10);
      
        Test.startTest();
       insert cars;
        Test.stopTest();
        List<Car__c> updatedCars = [SELECT Id, Name FROM Car__c where Premium__c=True];
        System.assertEquals(10, updatedCars.size());
    }

}