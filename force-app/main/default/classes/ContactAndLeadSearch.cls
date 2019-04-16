public with sharing class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(String name) {
        List<List<SObject>> searchList = [FIND :name IN Name FIELDS 
                                      RETURNING Contact, Lead];
        return searchList;
    }
}