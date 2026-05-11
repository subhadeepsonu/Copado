public with sharing class TestDataFactory {
    public static List<Employee__c> makeEmployees(Integer N) {
        List<Employee__c> employees = new List<Employee__c>();
        for(Integer i=0;i<N;i++){
            Employee__c e = new Employee__c();
            e.Name = 'Test '+i;
            e.Email__c = 'employee'+i+'@test.com';
            e.Department__c = 'Management';
            e.Joining_Date__c= System.today();
            employees.add(e);
            }
        return employees;   
    }
    public static List<Account> makeAccountsBatch(Integer N) {
        List<Account> Accounts = new List<Account>();
        for(Integer i=0;i<N;i++){
            Account a = new Account();
            a.Name = 'Test '+i;
            a.Industry='Technology';
            Accounts.add(a);
        }
        return Accounts;
    }
    public static List<Car__c> makeCars(Integer N) {
        List<Car__c> cars = new List<Car__c>();
          User u = new User(
    Alias = 'test',
    Email = 'testuser@example.com',
    EmailEncodingKey = 'UTF-8',
    LastName = 'Testing',
    LanguageLocaleKey = 'en_US',
    LocaleSidKey = 'en_US',
    ProfileId = [SELECT Id FROM Profile WHERE Name='Standard User' LIMIT 1].Id,
    TimeZoneSidKey = 'Asia/Kolkata',
    UserName = 'testuser' + System.currentTimeMillis() + '@example.com'
);
insert u;
        for(Integer i=0;i<N;i++){
            Car__c c = new Car__c();
            c.Name = 'Car '+i;
            c.Model__c = 'Sedan';
            c.Status__c = 'Available';
            c.Price__c = 200000 + i;
            c.Processed__c=false;
            c.OwnerId = u.Id;
                    cars.add(c);
        }
        return cars;
        }
    public static List<Account> makeAccountsBatch2(Integer N) {
        List<Account> Accounts = new List<Account>();
        for(Integer i=0;i<N;i++){
            Account a = new Account();
            a.Name = 'Test'+i;
            a.Active__c=true;
            a.Number_Of_Contacts__c=0;
            a.Industry='Technology';
            Accounts.add(a);
        }
        return Accounts;
    }
    
    public static List<Case> makeCases(Integer N) {
        List<Case> cases = new List<Case>();
        for(Integer i=0;i<N;i++){
            Case c = new Case();
            c.Subject = 'Test data case ' + i;
            cases.add(c);
        }
        return cases;
    }
    public static List<Lead> makeLeads(Integer N) {
        List<Lead> leads = new List<Lead>();
        for(Integer i=0;i<N;i++){
            Lead l = new Lead();
            l.LastName = 'Test '+i;
            l.Company = 'Test '+i;                
            leads.add(l);
        }
        return leads;
    }    
    public static List<Account> makeAccounts(Integer N,String BillingState) {
        List<Account> Accounts = new List<Account>();
        for(Integer i=0;i<N;i++){
            Account a = new Account();
            a.Name = 'Test '+i;
             a.BillingCountry = 'United States';
            a.BillingState = BillingState;
            Accounts.add(a);
        }
        return Accounts;
    }
}