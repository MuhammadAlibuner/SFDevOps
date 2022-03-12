public class Parser_New{
    public Blob myfile{get;set;}
    public Parser_New(){
        reports = new List<leaddata>(); 
    }
    
    public List<leaddata> reports {get;set;}
    
    public class leaddata {
        public String FirstName {get; set;}
        public String LastName {get; set;}
        public String Phone {get; set;}
        public String Email {get; set;}
       // public String Occupancy_MtgPlanner_CRM__Occupancy__c{get;set;}
       // Public String PurchasePrice_MtgPlanner_CRM__Purchase_Price__c{get; set;}
       // public String LoanType1stTD_MtgPlanner_CRM__Loan_Type_1st_TD__c{get;set;}
       // Public String LoanApplicationDate_MtgPlanner_CRM__Loan_Application_Date__c{get;set;}
       // public String Rate1stTD_MtgPlanner_CRM__Rate_1st_TD__c{get;set;}
       // public String LoanAmount1stTD_MtgPlanner_CRM__Loan_Amount_1st_TD__c{get;set;}
    }
    
    
    
    // private void parseReports(DOM.XMLNode node) {
    //    for (Dom.XMLNode child : node.getChildElements()) {
    //        if (child.getName() == 'record') {
    //            System.debug('child'+child);
                //parseReport(child);
                //  reports.add(r);
     //       }
           // System.debug('reports'+reports);
     //   }
    //}
    
    private void parseReports(DOM.XMLNode node) {
        
        for (Dom.XMLNode node1 : node.getChildren()) {
                for(Dom.XmlNode node2:node1.getChildren())
                {
                    for(Dom.XmlNode node3:node2.getChildren())
                    {
                        for(Dom.XmlNode node5:node3.getChildren())
                        {
                            if(node5.getName() =='DEAL')
                            {
                                parseReport(node5);
                            }
                        }
                    }
         			
                }
           
           // System.debug('reports'+reports);
        }
    }
    
    private void parseReport(DOM.XMLNode node5 ) {
        leaddata r = new leaddata();
        //system.debug(DOM.XmlNode node);
        List<Account> newList = new List<Account>();
        List<String> testRecord = new List<String>();
        for(Dom.XmlNode node6:node5.getChildren())
        {
            //system.debug(node6.getName());
            for(Dom.XmlNode node7:node6.getChildren())
            {
                if(node7.getName() == 'LOAN')
                {
                    for(Dom.XmlNode node8:node7.getChildren())
                    {
                        if(node8.getName() == 'LOAN_DETAIL')
                        {
                            for(Dom.XmlNode node9:node8.getChildren())
                            {
                                if(node9.getName() == 'ApplicationReceivedDate')
                                {
                                    //system.debug(node9.getText());
                                    //Application Date
                                    testRecord.add('Application Date '+node9.getText());
                                }
                                 
                            }
                           
                        }
                        if(node8.getName() == 'TERMS_OF_LOAN')
                        {
                            for(Dom.XmlNode node9:node8.getChildren())
                            {
                                //system.debug(node9.getName());
                                if(node9.getName() == 'BaseLoanAmount') 
                                {
                                    //system.debug(node9.getText());
                                    //Loan Amount (1st TD)
                                    testRecord.add('Loan Amount (1st TD)'+node9.getText());
                                }
                                if(node9.getName() == 'MortgageType')
                                {
                                    //system.debug(node9.getText());
                                    //Loan Type (1st TD)
                                    testRecord.add('Loan Type (1st TD)'+node9.getText());
                                }
                            }
                        }
                        for(Dom.XmlNode node9:node8.getChildren())
                        {
                            for(Dom.XmlNode node10:node9.getChildren())
                            {
                                if(node10.getName() == 'AmortizationType'){
                                    ///system.debug(node10.getText());
                                    //Loan Type (1st TD)
                                    testRecord.add('Loan Type (1st TD)'+node10.getText());
                                }
                                
                            }
                            
                        }
                    }
                    
                }
				for(Dom.XmlNode node8:node7.getChildren())
                {
                    if(node8.getName()=='SUBJECT_PROPERTY')
                    {
                        for(Dom.XmlNode node9:node8.getChildren())
                        {
                            if(node9.getName()=='ADDRESS')
                            {
                                for(Dom.XmlNode node10:node9.getChildren())
                                {
                                   // system.debug(node10.getText());
                                   if(node10.getName() == 'AddressLineText')
                                   {
                                       //property Address
                                      testRecord.add('property Address '+node10.getText());
                                   } if(node10.getName() == 'CityName')
                                   {
                                       //property City
                                       testRecord.add('property City '+node10.getText());
                                   } if(node10.getName() == 'StateCode')
                                   {
                                       //Property State
                                       testRecord.add('Property State '+node10.getText());
                                   }
                                    
                                    
                                   
                                    
                                    
                                }
                            }
                            if(node9.getName()=='PROPERTY_DETAIL')
                            {
                                for(Dom.XmlNode node10:node9.getChildren())
                                {
                                    if(node10.getName() =='AttachmentType')
                                    {
                                        //system.debug(node10.getText());
                                        //property Type
                                        testRecord.add('property Type '+node10.getText());
                                    }
                                    if(node10.getName() == 'PropertyUsageType')
                                    {
                                        //Occupancy
                                        testRecord.add('Occupancy '+node10.getText());
                                    }
                                    
                                }
                                
                            }
                            for(Dom.XmlNode node10: node9.getChildren())
                            {
                                for(Dom.XmlNode node11:node10.getChildren())
                                {
                                    for(Dom.XmlNode node12:node11.getChildren())
                                    {
                                        
                                        if(node12.getName() == 'SalesContractAmount')
                                    	{
                                        	//Purchase Price
                                        	testRecord.add('Purchase Price '+node12.getText());
                                    	}
                                    }
                                    
                                }
                                
                            }
                            
                        }
                    }
                    
                }
            }
           
        }
            
       system.debug(testRecord);
        
    }

    public void doUpload() {
        
        DOM.Document doc = new DOM.Document();
        doc.load(String.valueOf(myfile.toString()));    
        parseReports(doc.getRootElement()); 
    }

    
}