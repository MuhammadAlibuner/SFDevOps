@IsTest
public class AccountProcessorTest {
    public static testmethod Set<Id> AccountIDS()
    {
        Set<Id> ids = new Set<Id>();
    	List<Account> accId = [SELECT Id FROM Account];
		for(Account AccountIds:accId){
        	ids.add(AccountIds.Id);
    	}
        return ids;
    }
    public static testmethod void TestAccountProcessorTest() 
    {
        Account a = new Account();
        a.Name = 'Te Account';
        a.First_Name__c = 'asdf';
        a.Last_Name__c = 'asdf';
        Insert a;

        Contact cont = New Contact();
        cont.FirstName ='Bob';
        cont.LastName ='Masters';
        cont.AccountId = a.Id;
        Insert cont;
        
        set<Id> setAccId = new Set<ID>();
        setAccId.add(a.id);
 
        Test.startTest();
            AccountProcessor.countContacts(setAccId);
       // AccountProcessorTest obj = new AccountProcessorTest();
       Set<Id> accId = AccountProcessor.AccountIDS();
        Test.stopTest();
        
        //Account acc = [select Number_of_Contacts__c from Account where Id = :a.Id LIMIT 1];
        //System.assertEquals ( Integer.valueOf(acc.Number_of_Contacts__c) ,1);
  }
  
}