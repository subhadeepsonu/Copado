public with sharing class BatchApex implements Database.Batchable<SObject> {
    public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator([SELECT Id,Name FROM Dog_breeds__c]);
    }
    public void execute(Database.BatchableContext BC, List<Dog_breeds__c> scope) {
        for(Dog_breeds__c db: scope){
            db.Name = db.Name + 'Test';
        }
        update scope;
    }
    public void finish(Database.BatchableContext BC) {
        System.debug('Batch completed');
    }
}