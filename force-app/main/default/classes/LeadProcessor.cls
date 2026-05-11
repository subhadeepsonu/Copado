public with sharing class LeadProcessor implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator([SELECT Id FROM Lead ]);
    }
    public void execute(Database.BatchableContext BC, List<Lead> scope) {
        for(Lead l: scope){
            l.LeadSource = 'Dreamforce';
        }
        update scope;
    }
    public void finish(Database.BatchableContext BC) {
    }
}