global class AccountProcessor {
	@future
	public static void countContacts(List<Id> recordIds) {
        System.debug(recordIds);
        List<Contact> listContact = [select Id, AccountId from Contact where AccountId in: recordIds];
        List<Account> listAccount = [select Id, Number_of_Contacts__c from Account where Id in: recordIds];
        List<Account> accsToUpdate = new List<Account>();
        // process account records to do awesome stuff
        Integer i = 0;
        for(Contact c : listContact) {
            for(Account a: listAccount) {
                if(c.AccountId == a.Id) {
                    i += 1;                    
                    a.Number_of_Contacts__c = i;
                    accsToUpdate.add(a);
                }
            }
        }
        
        update accsToUpdate;
	}
}