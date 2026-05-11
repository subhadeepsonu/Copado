public with sharing class ContactSearch {
    public static list<Contact> searchForContacts(String s1,String s2) {
        List<Contact> contacts = [SELECT Id,Name FROM Contact WHERE MailingPostalCode LIKE :s2+'%' AND LastName LIKE :s1+'%'];
        return contacts;
    }
}