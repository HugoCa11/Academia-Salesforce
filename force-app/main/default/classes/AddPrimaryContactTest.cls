@isTest
public class AddPrimaryContactTest {
    @testSetup 
    static void setup() {
        List<Account> accounts = new List<Account>();
        // add 100 child accounts
        for (Integer i = 0; i < 100; i++) {
            if(i < 50){
                accounts.add(new Account(
                	name='Test Account'+i, BillingState = 'CA'
            	));
            }else{
               accounts.add(new Account(
                	name='Test Account'+i, BillingState = 'NY'
            	)); 
            }            
        }
        insert accounts;
    }
    
    static testmethod void testQueueable() {
        // query for test data to pass to queueable class
        String billState = 'CA';
        Contact contact = new Contact(LastName = 'Wills');
        // Create our Queueable instance
        AddPrimaryContact apc = new AddPrimaryContact(contact, billState);
        // startTest/stopTest block to force async processes to run
        Test.startTest();        
        System.enqueueJob(apc);
        Test.stopTest();        
        // Validate the job ran. Check if record have correct parentId now
        System.assertEquals(50, [select count() from account where BillingState = 'CA']);
    }
}