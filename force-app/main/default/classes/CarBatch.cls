public with sharing class CarBatch implements Database.Batchable<SObject>,Database.Stateful {
    Integer TotalCarsProccesed=0;
    Integer TotalCarsFailed=0;
    Integer TotalCarsSuccess=0;
    public Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator([SELECT Id FROM Car__c where Status__c = 'Available' AND Processed__c = false]);
    }

   public void execute(Database.BatchableContext BC, List<Car__c> scope) {
    List<Car__c> cars = new List<Car__c>();
        for(Car__c car : scope){
            Car__c c = new Car__c();
            c.Id = car.Id;
            c.Processed__c = true;
            cars.add(c);
            TotalCarsProccesed++;
        }
        Database.SaveResult[] r = DataBase.update(cars,false);
        for(Database.SaveResult res : r){
            if(res.isSuccess()){
                TotalCarsSuccess++;
            }else{
                TotalCarsFailed++;
            }
        }

        
    }
    public void finish(Database.BatchableContext BC) {
        Messaging.SingleEmailMessage m = new Messaging.SingleEmailMessage();
        m.toaddresses = new String[]{ 'subhadeepthandaka@gmail.com'};
        m.subject = 'Daily Car batch update';
        m.plaintextbody = 'Total cars: '+ TotalCarsProccesed;
        m.plaintextbody+= 'Success: '+ TotalCarsSuccess;
        m.plaintextbody+= 'failed: '+ TotalCarsFailed;
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
        emails.add(m);
        Messaging.sendEmail(emails);
    }
}