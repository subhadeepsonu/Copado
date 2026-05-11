public with sharing class CarController implements Queueable {

    private List<Car__c> cars;

    public CarController(List<Car__c> cars) {
        this.cars = cars;
    }

   public void execute(QueueableContext context) {

    List<Car__c> queriedCars = [
        SELECT Id, Name, Price__c, Model__c, Owner.Email
        FROM Car__c
        WHERE Id IN :cars
    ];

    List<Car__c> updatedCars = new List<Car__c>();
    List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();

    for (Car__c car : queriedCars) {
        if (car.Price__c > 50000) {

            updatedCars.add(new Car__c(
                Id = car.Id,
                Premium__c = true
            ));

            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            if(car.Owner!= null && car.Owner.Email != null){
            mail.toAddresses = new String[] { car.Owner.Email };
            mail.subject = 'Premium Car Notification';
            System.debug(car.Owner);
            mail.plainTextBody = 'Your car has been marked as premium.';
            mail.plainTextBody += '\nCar: ' + car.Name;
            mail.plainTextBody += '\nPrice: $' + String.valueOf(car.Price__c);
            mail.plainTextBody += '\nModel: ' + car.Model__c;

            emails.add(mail);
        }
        }
    }

    if (!updatedCars.isEmpty()) {
        update updatedCars;
        Messaging.sendEmail(emails);
    }
}
}