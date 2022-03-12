@RestResource(urlMapping='/salesforceRestEndPoint/*')
global with sharing  class RestEndPoint {
  @HttpPost  
   global static String doPost() {  
   
     //Returns the RestRequest object for our Apex REST method.  
     RestRequest request = RestContext.request;  
     //Returns the RestResponse for our Apex REST method.  
     RestResponse response = RestContext.response;  
     //Access the request body with input data coming in the JSON format  
     String jSONRequestBody=request.requestBody.toString().trim();  
    // String jSONRequestBody=request.requestBody.replaceAll('\n','').replaceAll('\r','');
     //String jSONRequestBody=request.requestBody.replaceAll('\n','').replaceAll('\r','');
     //Deserializes the input JSON string into an GoCardless_Event__c object  
      system.debug(request.requestBody);
      system.debug(jSONRequestBody);
      ResponseResult e = (ResponseResult)JSON.deserialize(jSONRequestBody, ResponseResult.class);
     //Map<String, Object> m =   (Map<String, Object>) JSON.deserializeUntyped(BODY);
      system.debug(e);
      // for(integer i=0; i< e.events.size(); i++) {
            for(integer i=0; i< e.inbound_payloads.size(); i++) {
              if (e.inbound_payloads[i].action == 'new records') {
                system.debug('new Record is '+e.inbound_payloads[i].payloads);
              } if (e.inbound_payloads[i].action == 'order') {
                system.debug('Order is '+e.inbound_payloads[i].payloads);
              } if (e.inbound_payloads[i].action == 'new event') {
                system.debug('new event is '+e.inbound_payloads[i].payloads);
              }
     		     
              //system.debug(e.inbound_payloads[i].links.mandate);
             //system.debug(e.inbound_payloads[i].Payload);
           //GoCardless_Event__c gcevent = new goCardless_Event__c();
           //gcevent.name = e.events[i].Id;
           // gcevent.created_at__c = e.events[i].created_at;
           //gcevent.resource_type__c = e.events[i].resource_type;
          // gcevent.action__c = e.events[i].action;
          // gcevent.yourFieldName__c = e.events[i].links.mandate;
          // insert gcevent;
       }
       return 'Done';
    }

    public class ResponseResult {
    
        public inbound_payload[] inbound_payloads;

    }
   // public class Event {
    public class inbound_payload {
        public String action;
         //public String id, resource_type,action;
        //public datetime created_at;
        //public objLinks links;  
        public List<String> payloads;     
    }
    
    public class objLinks {
       string mandate;
    }

     
}