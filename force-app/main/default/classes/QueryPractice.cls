public with sharing class QueryPractice {
	public static List<Account> fetchRelated(String Id,String Name,String Phone)
    {
        List<Account> relatedAccount = [SELECT Name, (SELECT Name FROM Contacts),(SELECT Name FROM Opportunities) FROM Account WHERE Id=:Id AND Phone=:Phone AND Name=:Name];
       	system.debug('fetchRelated Record Start');
        system.debug(relatedAccount);
        system.debug('fetchRelated Record End');
        return relatedAccount;
    }
    
    public static  List<List<Object> > searchtext(string searchvalue)
    {
        //return null string searchvalue;
       
        System.debug('searchtext start');
        List <List <Object> > closelostopportunity = [FIND :searchvalue IN ALL FIELDS RETURNING Account(Name), Contact(FirstName,LastName,Department), Opportunity(Amount,Description Where StageName != 'Closed Lost')];
       	System.debug(closelostopportunity);
        System.debug('searchtext end');
        
        return closelostopportunity;
    }
    public static void recentRecord(String ssobject)
    {
        String query = 'SELECT Id From '+ssobject+' Order By createdDate Desc Limit 100';
        List<sObject> sLst = Database.query(query);
		system.debug('Recent Record start');
        for(sObject s: sLst)
        {
        
           System.debug(s);
        
        }
        system.debug('Recent Record End');
        //List<object> acclst = [Select Id from :sobject Order By createdDate Desc Limit 100];
        //return sLst;
    }
    ///List<sObject>
    
}