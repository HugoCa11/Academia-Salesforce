public class AddPrimaryContact implements Queueable {
    
    private Contact contact;
    private String stateAbb;
    
    public AddPrimaryContact(Contact cont, String sttAbb) {
        this.contact = cont;
        this.stateAbb = sttAbb;
    }
    public void execute(QueueableContext context) {
        List<Account> accounts = [select Id, (select Id from Contacts) from Account where BillingState =: stateAbb limit 200];
        List<Contact> contactsToInsert = new List<Contact>();
        for (Account account : accounts) {
          Contact cloneContact = new Contact(LastName = 'Wilis');
          cloneContact.AccountId = account.Id;
          cloneContact.clone();
          contactsToInsert.add(cloneContact);
          // perform other processing or callout
        }        
        insert contactsToInsert;
    }
    

}