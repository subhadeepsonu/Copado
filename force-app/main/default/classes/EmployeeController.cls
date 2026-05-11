public with sharing class EmployeeController {
@AuraEnabled(cacheable=true)
  public static List<Employee__c> getEmployee(String name) {
    try {
        if (name != null && name != '') {
            return [
                SELECT Id, Name,Department__c,Email__c, Joining_Date__c
                FROM Employee__c
                WHERE Name Like :('%'+name+'%')
            ];
        }            
        return [
                     SELECT Id, Name,Department__c,Email__c, Joining_Date__c
                FROM Employee__c
            ];
    } catch (Exception e) {
        System.debug(e.getMessage());
        return new List<Employee__c>();
    }
}
 @AuraEnabled
public static void createEmployee(
    String name,
    String email,
    String department,
    Date joiningDate
) {
    try {
        
        Employee__c emp = new Employee__c(
            Name = name,
            Email__c = email,
            Department__c = department,
            Joining_Date__c = joiningDate
        );
        insert emp;
    } catch (Exception e) {
        System.debug(e.getMessage());
    }
}
     @AuraEnabled
   public static void updateEmployee(String Name, String email, String department,Date joiningDate,Id empId){
    try {
        if(empId==null){
            throw new AuraHandledException('Employee Id cannot be null');
        }
        Employee__c emp = new Employee__c(Id=empId, Name=Name, Email__c=email, Department__c=department, Joining_Date__c=joiningDate);
        update emp;
    } catch (Exception e) {
        System.debug(e.getMessage());
    }
   }
    @AuraEnabled
   public static void deleteEmployee(Id empId){
    try {
        if(empId==null){
            throw new AuraHandledException('Employee Id cannot be null');
        }
        Employee__c emp = new Employee__c(Id=empId);
        delete emp;
    } catch (Exception e) {
        System.debug(e.getMessage());
    }
   }
}