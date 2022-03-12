public with sharing class AccountController {
    @AuraEnabled
    public static list <Account> findAccounts(String searchKey){
       // try {
            String key = '%'+searchKey+'%';
            return [SELECT Id,Name,AccountNumber FROM Account WHERE Name LIKE:key LIMIT 10];
       // } catch (Exception e) {
          //  throw new AuraHandledException(e.getMessage());
       // }
    }
    
}