public class PropertyUtility {
	public static void newListedProperties()
    {
        List<Property__c>newPropList = [SELECT Name,Broker__r.Email__c,Days_On_Market__c FROM Property__c WHERE Days_On_Market__c < 31];
        for(Property__C pro:newPropList)
        {
            String propEmail = 'Address:'+pro.Name+':'+pro.Broker__r.Email__C;
            system.debug(propEmail);
        }
    }
}