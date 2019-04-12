public with sharing class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numContacts, String lastName) {
        
        //List that will return the contacts to generate
        List<Contact> contactsToGenerate = new List<Contact>();

        //Loop to generate contacts with dynamic firstname and same lastname
        for(Integer i = 0; i < numContacts; i++) {
            Contact con = new Contact(FirstName='TestContact' + i, LastName=lastName);
            contactsToGenerate.add(con);
        }

        return contactsToGenerate;
    }
}
