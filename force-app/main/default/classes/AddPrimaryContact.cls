public with sharing class AddPrimaryContact implements  Queueable{
    public Contact contact;
    public String ContactState;
    public AddPrimaryContact(Contact contact,String ContactState) {
        this.contact = contact;
        this.ContactState = ContactState;
    }
    public void execute(QueueableContext context) {
      List<Account> accs = [SELECT Id, Name FROM Account WHERE BillingState=:ContactState  LIMIT 200];
      List<Contact> cons = new List<Contact>();
      for(Account acc:accs){
        Contact c = new Contact();
        c = contact.clone(false,false,false,false);
        c.AccountId = acc.Id;
        cons.add(c);
      }
      insert cons;
    }
}