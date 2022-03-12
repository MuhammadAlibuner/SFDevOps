public class AccountProcessor {
    
    public static Set<Id> AccountIDS()
    {
        Set<Id> ids = new Set<Id>();
    	List<Account> accId = [SELECT Id FROM Account];
		for(Account AccountIds:accId){
        	ids.add(AccountIds.Id);
    	}
        countContacts(ids);
        return ids;
    }
    
    
         //Set<Id> accId = AccountIDS();
    @future 
	public static Void countContacts(Set<Id> accId)
    {	
        List<Account> accountList = [select id,Number_of_Contacts__c , (select id from contacts ) from account where id in :accId];
        for(Account ids:accountList)
        {
            List<Contact> contlist = new List<Contact>();	
            ids.Number_Of_Contacts__c = contlist.size();
        }
        update accountList;
        
    }
}