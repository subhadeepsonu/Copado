trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
    List<Task> newTasks = new List<Task>();
    for(Opportunity opp : Trigger.new){
        if(opp.StageName=='Closed Won'){
            Task ts = new Task();
            ts.WhatId = opp.Id;
            ts.Subject = 'Follow Up Test Task';    
            newTasks.add(ts);        
        }
    }
    insert newTasks;
}