@isTest
public class TestClassForBatch {
	
    static testmethod void test(){
        Account accc = new Account();
        accc.Name='Test Account for test class';
        insert accc;
        Contact con = new Contact();
        for (Integer i=0;i<9;i++){
            con.FirstName='first Name of Contact';
            con.LastName='Last Name of Contact';
            insert con;
        }
       Test.startTest();
       CreateTaskForContact bb = new CreateTaskForContact();
        Database.executeBatch(bb);
        Test.stopTest();
    }
    
}