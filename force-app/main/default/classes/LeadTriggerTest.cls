//Test of Lead Trigger
@isTest
public with sharing class LeadTriggerTest {
    
    //Verify with the email, if the email exists in the database
    @isTest
    static void verifyIsntRepeat(){
        Lead adrianBruno = Build.aLead()
                                .withLastName('Bruno')
                                .withEmail('gastonSuarez@hotmail.com')
                                .withCompany('Globant')
                                .build();
        Test.startTest();
            Database.SaveResult sr= Database.insert(adrianBruno,false);
        Test.stopTest();
        List<Lead> leadsTotal= new List<Lead>(); 
        leadsTotal= [
            SELECT Id
            FROM Lead
            WHERE email = 'gastonSuarez@hotmail.com'
        ];
        System.assertEquals('Cannot insert a lead with an existing email',sr.getErrors()[0].getMessage(),'The insertion of a record with duplicate mail was allowed');                  
        System.assertEquals(1,leadsTotal.size(),'There is more than one lead record with the same email');                     
    }

    @TestSetup
    static void makeData(){
        Lead gastonSuarez = Build.aLead()
                                  .withLastName('Suarez')
                                  .withEmail('gastonSuarez@hotmail.com')
                                  .withCompany('Xappia')
                                  .build();
        /*Lead gastonSuarez = new Lead (
                                email='gastonSuarez@hotmail.com',
                                LastName='Suarez',
                                Company='Xappia'
        );*/
        insert gastonSuarez;
        
    }
}