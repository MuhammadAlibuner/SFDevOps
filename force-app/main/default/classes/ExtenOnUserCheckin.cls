public class ExtenOnUserCheckin {
      
    public String firstName{get;set;}
    public String LastName{get;set;}
    public Date Sdate{get;set;}
    public String FirstnameError{get;set;}
    public String LastNameError{get;set;}
    public String DateError{get;set;}
    public String SuccessMessage{get;set;}
    Public ExtenOnUserCheckin(ApexPages.StandardController controller) {
            //id = System.currentPageReference().getParameters().get('id');
     }
    public void saveForm()
    {
        boolean iss = true;
        //regular Expression
        String reg = '^[A-Za-z0-9]*$';
        Pattern mypattern = Pattern.compile(reg);
        //Match With First Name
        Matcher FirstMatcher = mypattern.matcher(firstName);
        boolean Firstresult = FirstMatcher.matches();
        //Match With Last Name
        Matcher LastMyMatcher = mypattern.matcher(LastName);
        boolean Lastresult = LastMyMatcher.matches();
        //Check Date difference if less than 0 then it will be past date
        Date startDate = Date.today();
        Integer noOfDays = startDate.daysBetween( Sdate );
        
        if(Firstresult==false)
        {
            iss=false;
            FirstnameError = 'Please Enter Valid First Name';
        }else{FirstnameError = '';}
        if(Lastresult == false){
            iss=false;
            LastNameError = 'Please Enter Valid Last Name';
        } else{LastNameError = '';} if(noOfDays<0){
            iss=false;
            DateError = 'Please Enter today or Up Comming Date';
        }else{DateError = '';} if(iss ==true)
        {
            SuccessMessage = 'Form submitted successfully';
        }
        system.debug( 'Output is ' + noOfDays );
        system.debug('bolean First '+Firstresult);
      	system.debug('bolean Last '+Lastresult);
        system.debug('first Param '+firstName);
        system.debug('Last Param '+LastName);
        system.debug('Date '+Sdate);
    }
}