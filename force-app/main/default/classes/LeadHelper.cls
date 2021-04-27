//Lead Trigger Handler
public with sharing class LeadHelper {

    //Verify the new mails of the trigger isn't in the database.
    public static void verifyRepetedMail(List<Lead> leadsNew){  
        List<String> emailList = new List <String>();
        for(Lead mailLead  : leadsNew){
            emailList.add(mailLead.email);
        }
        List <Lead> leads = new List <Lead>();
        leads = [
                SELECT Id,email
                FROM Lead
                WHERE email IN :emailList
        ];                    
        Map<String, Lead> leadByEmail = new Map<String, Lead>();
        for(Lead ld : leads){
            if(!leadByEmail.containsKey(ld.email)){
                leadByEmail.put(ld.email,ld);
            }
        }                                           
        for(Lead leadNew : leadsNew){
            if(leadByEmail.containsKey(leadNew.email)){
                leadNew.addError('Cannot insert a lead with an existing email');
            }              
        }                    
    }
}