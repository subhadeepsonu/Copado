trigger HighPriorityCaseMail on Case (after insert) {
    if(trigger.isAfter && trigger.isInsert){
        CaseHandler.mailBasedOnCasePriority(trigger.new);
    }
}