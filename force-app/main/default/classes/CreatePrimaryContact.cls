public with sharing class CreatePrimaryContact implements Database.Batchable<SObject>,Database.Stateful {
    Integer totalProcessed = 0;
    Integer Success = 0;
    Integer failed = 0;
    public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator([SELECT Id,Name FROM Account WHERE Active__c=true AND Number_Of_Contacts__c=0]);
    }
    public void execute(Database.BatchableContext BC, List<Account> scope) {
        List<Contact> conts = new List<Contact>();
        for(Account a : scope){
            Contact c = new Contact(LastName = a.Name, AccountId = a.Id,Email=a.Name + '@test.com',Type__c='Primary');
            conts.add(c);
        }
     Database.SaveResult[] r =   Database.insert(conts,false);
     for(Database.SaveResult res : r){
        if(res.isSuccess()){
            Success++;
        }
        else{
            failed++;
        }
          totalProcessed++;
     }
    }
    public void finish(Database.BatchableContext BC) {
        try {
        Messaging.SingleEmailMessage m = new Messaging.SingleEmailMessage();
        m.setToAddresses(new String[] {'subhadeepthandaka@gmail.com'});
        m.setSubject('Batch Complete');
        m.setPlainTextBody('Total Processed: ' + totalProcessed + ', Success: ' + Success + ', Failed: ' + failed);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {m});
        } catch (Exception e) {
            System.debug(e.getMessage());
        }
        
    }
}