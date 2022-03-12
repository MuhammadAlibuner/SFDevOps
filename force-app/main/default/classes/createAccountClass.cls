public class createAccountClass {
	public void method1(List<Contact> accList,List<Contact> accNew){
       
        // Getting the list of the account.
       	String newValue;
        String oldValue;
        for(Contact newRec:accNew)
        {
            newValue = newRec.Email;
            system.debug('new value '+newValue);
        }
        for(Contact acc:accList){
             if(acc.Email!=newValue)
             {
                system.debug('account Id is '+acc.AccountId);
                Account accountRec = [SELECT Name FROM Account WHERE Id =:acc.AccountId LIMIT 1];
                system.debug('Account Name '+accountRec.Name);
                Account newAccount = new Account();
                newAccount.Name = acc.Title+' '+accountRec.Name;
                newAccount.Id = accountRec.Id;
                update newAccount;
             }
        }
       
      
    }
}