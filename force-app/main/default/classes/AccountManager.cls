@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        String temp = request.requestURI.substring(0, request.requestURI.lastIndexOf('/'));
        String accountId = temp.substring(temp.lastIndexOf('/')+1);
        Account result = [select Id, Name, (select Id, Name from Contacts) 
                        from Account 
                        where Id = :accountId];
        return result;
    }
}
