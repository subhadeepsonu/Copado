trigger CreateTaskBasedOnOppertunityStatus on Opportunity (after insert,after update) {
    if(trigger.isAfter  ) {
        if(trigger.isInsert){
            OppertunityHandler.insertaskBasedOnOppertunityInsert(trigger.new);
        }
        if(trigger.isUpdate){
            OppertunityHandler.insertaskBasedOnOppertunityUpdate(trigger.newMap, trigger.oldMap);
        }
    }
    
}