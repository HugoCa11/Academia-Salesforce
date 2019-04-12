@isTest
public class TestRestrictContactByName {
	@isTest
    static void TestInsertInvalidName() {
        Contact contact = new Contact(LastName = 'INVALIDNAME');
        
        Test.startTest();
        insert contact;
        Test.stopTest();
        
    }
    
    @isTest
    static void TestUpdateInvalidName() {
        Contact contact = new Contact(LastName = 'Smith');
        insert Contact;
        Contact contactToUpdate = [select LastName from Contact where LastName = 'Smith'];
        contactToUpdate.LastName = 'INVALIDNAME';
        
        Test.startTest();
        update contactToUpdate;
        Test.stopTest();
    }
}