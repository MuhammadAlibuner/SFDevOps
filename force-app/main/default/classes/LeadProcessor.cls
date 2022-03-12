global class LeadProcessor implements Database.Batchable<sObject> {
        global Database.QueryLocator start(Database.BatchableContext Bc)
        {
            String query = 'SELECT Id,LeadSource FROM Lead';
            return Database.getQueryLocator(query);
        }
        global static void execute(Database.BatchableContext Bc,List<Lead> leadRec)
        {
            List<Lead> updateLead = new List<Lead>();
            for(Lead leadRecord:leadRec){
               leadRecord.LeadSource = 'Dreamforce';
               updateLead.add(leadRecord);
            }
			update updateLead;            
        }
        global static void finish(Database.BatchableContext BC)
        {
            
        }
    }