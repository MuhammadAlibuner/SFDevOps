public class InsertDataUsingApi {
	public static String getToken() {
        String loginUri='https://login.salesforce.com/services/oauth2/token';
        String clientId='3MVG9fe4g9fhX0E4nldJ3bxKEN9WDRYTJVdpsR9BwGZNOIUkQdGL7v9hRjp9KlJ0GHczL2qxWYX4pDB_DU.kM';
        String clientSecret='BA84924A7ED4319CDC4AFBD5D2F466F78C1609A9F5C88CD29D20511E493FBBE9';
        String username='salesforcetactics@wnwsolution.com';
        String password='64049tacticsfIHHHB7bNmORIUmEXiVdXvag';
        //creat new http request
        HttpRequest request = new HttpRequest();
        request.setEndpoint(loginUri);
        //set http request to post
        request.setMethod('POST');
        //set form-data or body
        request.setBody('grant_type=password' +
                        '&client_id=' + clientId +
                        '&client_secret=' + clientSecret +
                        '&username=' + EncodingUtil.urlEncode(username, 'UTF-8') +
                        '&password=' + EncodingUtil.urlEncode(password, 'UTF-8'));
        
        String token = null;
        try {
            
            //receiving http response in httpResponse 
            Http http = new Http();
            HttpResponse res  = http.send(request);
            
            //check if response is success
            if (res.getStatusCode() == 200 ) {
                
                //get response body in String
                String BODY = res.getBody();
                
                //once we get the response here we convert the object to map to get the token
                Map<String, Object> m =   (Map<String, Object>) JSON.deserializeUntyped(BODY);
                token =  m.get('access_token').toString();
               
            }
            
            
        }
        catch(Exception ex) {  throw ex; } 
        
        if(!String.isBlank(token)) {
            system.debug(token);
            return token; 
            } 
        else{ return null; 
        }
        
    }
    public static void insertAccount()
    {
        String endPoint='https://ap15.salesforce.com/services/data/v52.0/sobjects/Account/';
       String token = getToken();
        system.debug(token);
        //creat new http request
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endPoint);
        //set http request to post
        request.setMethod('POST');
        
        request.setHeader('Authorization','Bearer '+token);
        //"Content-Type: application/json" -d "@newaccount.json"
       
        //set form-data or body
         request.setHeader('Content-Type','application/json');
        // Set the body as a JSON object
        request.setBody('{"Name":"live data test"}');
        
        
        try {
            
            //receiving http response in httpResponse 
            Http http = new Http();
            HttpResponse res  = http.send(request);
            
            //check if response is success
            if (res.getStatusCode() == 201 ) {
                system.debug('success');
               
                String BODY = res.getBody();
                system.debug(BODY);
               
                Map<String, Object> m =   (Map<String, Object>) JSON.deserializeUntyped(BODY);
            }
            else{
                system.debug('failed');
                system.debug(res.getStatusCode());
            }
            
            
        }
        catch(Exception ex) {  throw ex; } 
    }
}