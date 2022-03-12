public with sharing class DepartmentAccount {
    public DepartmentAccount() {

    }
    @AuraEnabled
    public static List<Account>  fetchAccountDepartment(){
        List<Account> data = [SELECT Name,(SELECT Name,Email,Phone from Contacts) from Account WHERE CreatedDate = THIS_WEEK];
        return data;
    }
    @AuraEnabled
    public static List<Contact> fetchSingle(String id){
        List<Contact> singleContact = [SELECT FirstName,LastName,Email,Phone FROM Contact WHERE Id=:id LIMIT 1];
        return singleContact;
    }
    @AuraEnabled
    public static string addContact(String firstName,String lastName,String Email, String Phone){
        Contact add = new Contact();
        add.FirstName = firstName;
        add.LastName = lastName;
        add.Email = Email;
        add.Phone = Phone;
       
        insert add;
        return add.Id;
    }
    
}