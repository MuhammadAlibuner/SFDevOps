public class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(String searchvalue){
        List<List<sObject>> searchlist = [FIND :searchvalue IN ALL FIELDS RETURNING Lead(Name), Contact(FirstName,LastName,Department)];
        return searchlist;
    }
}