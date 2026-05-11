public with sharing class SchduleBatchUpdateAccount implements Schedulable {
    public void execute(SchedulableContext sc) {
     Database.executeBatch(new BatchUpdateAccount(),200);
    }
}