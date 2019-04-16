public with sharing class ContactSearch {
    public static List<Contact> searchForContacts(String lastName, String mailingPostalCode) {
        List<Contact> contact = [select Id, Name 
                                from Contact 
                                where LastName=: lastName and MailingPostalCode=: mailingPostalCode];
        return contact;
    }
}