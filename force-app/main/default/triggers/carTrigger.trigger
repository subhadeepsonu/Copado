trigger carTrigger on Car__c (after insert) {
    if(trigger.isAfter  && trigger.isInsert){
        System.enqueueJob(new CarController(trigger.new));
    }
}