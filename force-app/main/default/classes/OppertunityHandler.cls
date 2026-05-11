public with sharing class OppertunityHandler {
    public static void insertaskBasedOnOppertunityInsert(List<Opportunity> Oppertunities){
    try {
        List<Task> Tasks = new List<Task>();
        for(Opportunity opp : Oppertunities){
            if(opp.StageName=='Prospecting'){
                Task t = new Task(WhatId=opp.Id,Subject='Follow up with the customer within 7 days.');
                Tasks.add(t);
            }
    }
        if(!Tasks.isEmpty()){
        insert Tasks;
        }
    } catch (Exception e) {
        System.debug(e.getMessage());
    }
   }
   public static void insertaskBasedOnOppertunityUpdate(Map<Id,Opportunity> newOpp,Map<Id,Opportunity> oldOpp){
    try {
        List<Task> Tasks = new List<Task>();
        for(Id opp : newOpp.keySet()){
            if(newOpp.get(opp).StageName != oldOpp.get(opp).StageName && newOpp.get(opp).StageName == 'Prospecting'){
                Task t = new Task(WhatId=opp,Subject='Follow up with the customer within 7 days.');
                Tasks.add(t);
            }
        }
        if(!Tasks.isEmpty()){
        insert Tasks;
        }

    
    } catch (Exception e) {
                System.debug(e.getMessage());
    }
   }
 
}