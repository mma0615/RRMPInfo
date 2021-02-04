@istest
public with sharing class RRMPInfoControllerTest {
    //This test will check if a record is successfully found based on type field on the metadata object
    @isTest
    static void getRRMPContactInfoTest(){
        String contactType = 'RRMP_DI';
        RRMP_Contact_Info__c retrivedData = new RRMP_Contact_Info__c(); 
        
        test.startTest();
        retrivedData = RRMPInfoController.getRRMPContactInfo(contactType);
        test.stopTest();
        
        String screenMessage = [SELECT Screen_Message__c FROM RRMP_Contact_Info__c WHERE Name =: contactType LIMIT 1].Screen_Message__c;
        //Negative assert
        system.assertNotEquals(null, retrivedData.Screen_Message__c);
        //Positive assert
        system.assertEquals(screenMessage, retrivedData.Screen_Message__c);
    }
    
    //This test will forcefully feed an null value to catch the error handling when searching for a record
    @isTest
    static void getRRMPContactInfoNullTest(){
        String contactType = null;
        RRMP_Contact_Info__c retrivedData = new RRMP_Contact_Info__c();

        test.startTest();
        retrivedData = RRMPInfoController.getRRMPContactInfo(contactType);
        test.stopTest();
        
        //Negative assert
        system.assertEquals(null, retrivedData);
    }
}