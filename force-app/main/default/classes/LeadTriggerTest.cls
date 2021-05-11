//Test of Lead Trigger
@isTest
public with sharing class LeadTriggerTest {
    
    @TestSetup
    static void makeData(){
        Lead leadGeneralTest = Build.aLead()
                                    .withLastName('Suarez')
                                    .withEmail('gastonSuarez@hotmail.com')
                                    .withCompany('Xappia')
                                    .build();
        insert leadGeneralTest;
        
    }
    //Verify update any field except email
    @isTest
    static void updateAnyFieldExceptEmail(){
        Lead leadNew = [SELECT Company FROM Lead WHERE LastName = 'Suarez' LIMIT 1]; 
        leadNew.Company = 'Globant';
        test.startTest();
        update leadNew;
        test.stopTest();
        System.assertEquals('Globant',leadNew.Company,'Doesnt update lead records');
    }


    //Verify with the email, when insert,if the email exists in the database
    @isTest
    static void verifyInsertionOfNewRecord(){
        Lead leadTest = Build.aLead()
                                .withLastName('Bruno')
                                .withEmail('gastonSuarez@hotmail.com')
                                .withCompany('Globant')
                                .build();
        Test.startTest();
            Database.SaveResult sr= Database.insert(leadTest,false);
            if (sr.isSuccess()) {
                // Operation was successful, so get the ID of the record that was processed
                System.debug('Successfully inserted account. Account ID: ' + sr.getErrors());
            }
        Test.stopTest();
        List<Lead> leadsResults= new List<Lead>(); 
        leadsResults= [
            SELECT Id
            FROM Lead
            WHERE email = 'gastonSuarez@hotmail.com'
        ];
        System.assertEquals('A lead with this email address already exists',sr.getErrors()[0].getMessage(),'The insertion of a record with duplicate mail was allowed');                  
        System.assertEquals(1,leadsResults.size(),'There is more than one lead record with the same email');                     
    }

    //Verify with the email, when insert two records
    @isTest
    static void verifyInsertionOfNewRecords(){
        Lead leadTest = Build.aLead()
                              .withLastName('Hernandez')
                              .withEmail('yohandriHernandez@hotmail.com')
                              .withCompany('Globant')
                              .build();
        Lead leadTest2 = Build.aLead()
                              .withLastName('Benitez')
                              .withEmail('yohandriHernandez@hotmail.com')
                              .withCompany('Globant')
                              .build();
        List <Lead> leadsToInsert = new List <Lead>();
        leadsToInsert.add(leadTest);
        leadsToInsert.add(leadTest2);                                        
        Test.startTest();
        list<Database.SaveResult> leadsInsert= Database.insert(leadsToInsert,false);
        Test.stopTest();
        List<Lead> leadsResults= new List<Lead>(); 
        leadsResults= [
            SELECT Id
            FROM Lead
            WHERE email = 'yohandriHernandez@hotmail.com'
        ];
        for (Integer i = 1; i < leadsInsert.size(); i++) {
            System.assertEquals('Another new lead has the same email address',leadsInsert[i].getErrors()[0].getMessage(),'The insertion of a record with duplicate mail was allowed');                      
        } 
        System.assertEquals(1,leadsResults.size(),'There is more than one lead record with the same email');
    }

    //Verify with the email, when update one record
    @isTest
    static void verifyUpdateRecords(){
        Lead leadTest = Build.aLead()
                             .withLastName('Hernandez')
                             .withEmail('yohandriHernandez@hotmail.com')
                             .withCompany('Globant')
                             .build();
        insert leadTest;                     
        Test.startTest();
            leadTest.email = 'gastonSuarez@hotmail.com';
            Database.SaveResult leadInsert = Database.update(leadTest,false);
        Test.stopTest();
        List<Lead> leadsResults= new List<Lead>(); 
        leadsResults= [
            SELECT Id
            FROM Lead
            WHERE email = 'gastonSuarez@hotmail.com'
        ];
        System.assertEquals('A lead with this email address already exists',leadInsert.getErrors()[0].getMessage(),'The update of a record with duplicate mail was allowed');                  
        System.assertEquals(1,leadsResults.size(),'There is more than one lead record with the same email');
    }

    //Verify with the email, when update one record
    @isTest
    static void verifyUpdateMoreThanOneRecord(){
        Lead leadTest = Build.aLead()
                             .withLastName('Hernandez')
                             .withEmail('yohandriHernandez@hotmail.com')
                             .withCompany('Globant')
                             .build();
        Lead leadTest2 = Build.aLead()
                             .withLastName('Benitez')
                             .withEmail('federicoNieto@hotmail.com')
                             .withCompany('Globant')
                             .build();
        insert leadTest;
        insert leadTest2;                     
        List <Lead> leadsToUpdate = new List <Lead>();
        leadsToUpdate.add(leadTest);
        leadsToUpdate.add(leadTest2);                                                          
        Test.startTest();
            leadTest.email = 'zulayRosas@hotmail.com';
            leadTest2.email = 'zulayRosas@hotmail.com';
            List<Database.SaveResult> leadsUpdate = Database.update(leadsToUpdate,false);
        Test.stopTest();
        List<Lead> leadsResults= new List<Lead>(); 
        leadsResults= [
            SELECT Id
            FROM Lead
            WHERE email = 'zulayRosas@hotmail.com'
        ];
       /* for(Integer i = 1; i < leadsUpdate.size(); i++){
            System.assertEquals('Another new lead has the same email address',leadsUpdate[i].getErrors()[0].getMessage(),'The update of a record'
                                 + 'with duplicate mail was allowed');                  
        }*/
        System.assertEquals(1,leadsResults.size(),'There is more than one lead record with the same email');
    }

  
}