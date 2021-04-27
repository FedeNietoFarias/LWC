//Lead Trigger Handler
public with sharing class TLeadTriggerHandler {

    //Verify the new mails of the trigger isn't in the database.
    public static void verifyRepetedMail(List<Lead> listLeadNew){  
        List<String> emailList = new List <String>();
        for(Lead mailLead  : listLeadNew){
            emailList.add(mailLead.email);
        }
        List <Lead> repetedEmailLead = new List <Lead>();
        repetedEmailLead = [
                SELECT Id,email
                FROM Lead
                WHERE email IN :emailList
        ];                    
        Map<String, Lead> mapRepetedEmailLead = new Map<String, Lead>();
        for(Lead ld : repetedEmailLead){
            if(!mapRepetedEmailLead.containsKey(ld.email)){
                mapRepetedEmailLead.put(ld.email,ld);
            }
        }                                           
        for(Lead leadNew : listLeadNew){
            if(mapRepetedEmailLead.containsKey(leadNew.email)){
                leadNew.addError('Cannot insert a lead with an existing email');
            }              
        }                    
    }
}