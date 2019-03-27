@isTest
global class ParkServiceMock implements WebServiceMock {
    global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
        // start - specify the response you want to send
        ParkServices.byCountryResponse response_x = 
            new ParkServices.byCountryResponse();
        response_x.return_x = 3.0;
        // end
        response.put('response_x', response_x); 
   }
}