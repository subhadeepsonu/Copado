public with sharing class QueueableExample implements Queueable {
    public Contact contPassed;
    public QueueableExample(Contact cont){
        contPassed=cont;
    }
    public void execute(QueueableContext context) {
     contPassed.FirstName='queueable';
     update contPassed;
    }
}