public with sharing class RRMPInfoController {
    @AuraEnabled
    public static RRMP_Contact_Info__c getRRMPContactInfo (String contactType){
        RRMP_Contact_Info__c conDetails;
        
        try {
            /***** Querying fields from custom object RRMP_Contact_Info__c
                where record type name = contacttype and active is true
            */
            conDetails = [SELECT Id, Screen_Message__c, Contact_Email__c,
                Contact_Number__c, Fax_Number__c FROM RRMP_Contact_Info__c 
                WHERE recordtype.name =: contactType and active__c = true LIMIT 1];
        } catch (Exception e){
            System.debug('The following exception has occurred: ' + e.getMessage() + '. In stacktrace: ' + e.getStackTraceString());
        }
        return conDetails;
    }
}
