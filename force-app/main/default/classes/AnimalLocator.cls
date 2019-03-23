public class AnimalLocator {
    public static String getAnimalNameById(Integer num) {
        String animalName  = '';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + num);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            System.debug('results ' + results);
            // Cast the values in the 'animals' key as a list
            Map<String, Object> animal = (Map<String, Object>) results.get('animal');
            animalName += String.valueof(animal.get('name'));            
        }
        return animalName;
    }
}