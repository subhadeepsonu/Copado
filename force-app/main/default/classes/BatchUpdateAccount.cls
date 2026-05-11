public with sharing class BatchUpdateAccount implements Database.Batchable<SObject>,Database.Stateful {
    Integer proccesedRecordSuccess=0;
    Integer TotalRecords=0;
    public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator([SELECT Id, Name FROM Account WHERE Industry ='Technology' AND 	Rating!='Hot']);
    }
    public void execute(Database.BatchableContext BC, List<Account> scope) {
        try {
               List<Account> updatedAccounts = new List<Account>();
        for(Account acc : scope){
            acc.Rating = 'Hot';
            updatedAccounts.add(acc);
            TotalRecords++;
        }
        Database.SaveResult[] results = Database.update(updatedAccounts,false);
        for(Database.SaveResult r : results){
            if(r.isSuccess()){
                proccesedRecordSuccess++;
            }
        }
            
        } catch (Exception e) {
            System.debug(e.getMessage());
        }
     
    }
    public void finish(Database.BatchableContext BC) {
        System.debug('Total records : '+TotalRecords);
        System.debug('Succesful operations : '+proccesedRecordSuccess);
}
}