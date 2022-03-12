public class ContactSearch {
	public static List<Contact> searchForContacts(String lastname,String mailingPostalCode)
    {
        
        List<Contact> conlist = [SELECT Id,Name FROM Contact WHERE LastName=:lastname AND MailingPostalCode=:mailingPostalCode];
        return conlist;
    }
}