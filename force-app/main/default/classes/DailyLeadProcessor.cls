public with sharing class DailyLeadProcessor implements Schedulable{
    public void execute(SchedulableContext sc) {
        List<Lead> leads = [SELECT Id FROM Lead WHERE LeadSource = NULL LIMIT 200];
        for(Lead l: leads){
            l.LeadSource = 'Dreamforce';
        }
        update leads;
    }
}