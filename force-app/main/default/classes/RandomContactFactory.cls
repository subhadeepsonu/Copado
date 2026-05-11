public with sharing class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer N,String lstName) {
        List<Contact> contacts = new List<Contact>();
        for(Integer i=0;i<N;i++){
            Contact c = new Contact();
            c.LastName = lstName;
            c.FirstName = 'Test '+i;
            contacts.add(c);
        }
        return contacts;
    }
}