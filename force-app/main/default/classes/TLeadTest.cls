
@isTest
public with sharing class TLeadTest {
    
    //Verify with the email, if the email exists in the database
    @isTest
    static void verifyIsntRepeat(){
        Lead adrianBruno = new Lead (
                            email='gastonSuarez@hotmail.com',
                            LastName='Bruno',
                            Company='Globant'
                            );
       // List <Lead> listNewLeads = new List<Lead>(adrianBruno);
        Test.startTest();
            Database.SaveResult sr= Database.insert(adrianBruno,false);
            if (sr.isSuccess()) {
                // Operation was successful, so get the ID of the record that was processed
                System.debug('Successfully inserted lead. Lead ID: ' + sr.getId());
            }
            else{
                System.debug(sr.getErrors());
                
            }
        Test.stopTest();
        List<Lead> totalLeads= new List<Lead>(); 
             totalLeads= [SELECT Id
                          FROM Lead
                          WHERE email = 'gastonSuarez@hotmail.com'];
        System.assertEquals(sr.getErrors()[0].getMessage(),'Cannot insert a lead with an existing email','Se permitio la insercion de un registro con mail duplicado');                  
        System.assertEquals(totalLeads.size(),1,'Hay mas de un registro con un mismo MAIL');                     
    }

    @TestSetup
    static void makeData(){
        Lead gastonSuarez = new Lead (
                            email='gastonSuarez@hotmail.com',
                            LastName='Suarez',
                            Company='Xappia'
                            );
        insert gastonSuarez;
        
    }
}
