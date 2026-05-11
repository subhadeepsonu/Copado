public with sharing class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(String s1) {
        List<List<SObject>> searchResults = [FIND :s1 IN NAME FIELDS RETURNING Contact(Id, Name, Account.Name), Lead(Id, Name, Company)];
        return searchResults;
    }
}