
@isTest
private class EmployeeControllerTest {
    @TestSetup
    static void makeData(){
        List<Employee__c> emps = TestDataFactory.makeEmployees(10);
        insert emps;
    }

    @isTest
    static void getEmployeeTest() {
        Test.startTest();
        List<Employee__c> emp = EmployeeController.getEmployee('T');
        List<Employee__c> emp2 = EmployeeController.getEmployee('');
        Test.stopTest();
        Assert.areEqual(10, emp.size(), 'Should return all employees with T');
        Assert.areEqual(10, emp.size(), 'Should return all employees');
    }

     @isTest
    static void createEmployeeTest() {
        Test.startTest();
        EmployeeController.createEmployee('Test', 'Testemp@gmail.com', 'Management', System.today());
        Test.stopTest();
        List<employee__c> emps = [SELECT Id FROM Employee__c];
        Assert.areEqual(11, emps.size(), 'Should have 11 employees after insert');
        
    }
     @isTest
    static void updateEmployeeTest() {
        List<Employee__c> emp = [SELECT Id, Name FROM Employee__c LIMIT 1];
        Test.startTest();
        EmployeeController.updateEmployee('update', 'Testemp@gmail.com', 'Management', System.today(),emp[0].Id);
        Test.stopTest();
        List<Employee__c> updatedEmp = [SELECT Name FROM Employee__c WHERE Id = :emp[0].Id];
        Assert.areEqual('update', updatedEmp[0].Name, 'Employee name should be updated');
    }
     @isTest
    static void deleteEmployeeTest() {
        List<Employee__c> emp = [SELECT Id FROM Employee__c LIMIT 1];
        Test.startTest();
        EmployeeController.deleteEmployee(emp[0].Id);
        Test.stopTest();
        List<Employee__c> emps = [SELECT Id FROM Employee__c WHERE Id = :emp[0].Id];
        Assert.areEqual(0, emps.size(), 'Employee should be deleted');
    }
    @isTest
    static void deleteEmployeeExceptionTest(){
        Test.startTest();
        EmployeeController.deleteEmployee(null);
        Test.stopTest();
        // No assertion needed, just verifying no exception is thrown
    }
    @isTest
    static void updateEmployeeExceptionTest(){
        Test.startTest();
        EmployeeController.updateEmployee(null, null, null, null, null);
        Test.stopTest();
        // No assertion needed, just verifying no exception is thrown
    }
    @isTest
    static void createEmployeeExceptionTest(){
        Test.startTest();
        EmployeeController.createEmployee(null, null, null, null);
        Test.stopTest();
        // No assertion needed, just verifying no exception is thrown
    }
}