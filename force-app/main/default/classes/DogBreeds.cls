public with sharing class DogBreeds {
   public static void getDogBreeds() {
    Http httpCallout = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint('callout:dogs/breeds');
    request.setMethod('GET');
    HttpResponse response = httpCallout.send(request);
    List<DogBreadsWrapperClass.data> DogBreedsResponse = new List<DogBreadsWrapperClass.data>();
    DogBreedsResponse = DogBreadsWrapperClass.parse(response.getBody()).data;
    List<Dog_breeds__c> dbl = new List<Dog_breeds__c>();
    for(DogBreadsWrapperClass.data d: DogBreedsResponse){
        Dog_breeds__c db = new Dog_breeds__c();
        db.Name = d.attributes.name;
        db.description__c = d.attributes.description;        
        db.hypoallergenic__c = d.attributes.hypoallergenic;
        dbl.add(db);
    }
    insert dbl;    
    System.debug(dbl);
   }
}