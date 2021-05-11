//Lead Trigger Handler
public with sharing class LeadHelper {

    //Verify the new mails of the trigger isn't in the database.
    /*public static void verifyRepetedMail(List<Lead> leadsNew){  
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
    }*/


    //Verify the new mails of the trigger isn't in the database.
    public static void verifyInsert(List<Lead> leadsNew){
        Map<String, Lead> leadMap = new Map <String, Lead>();
        for (Lead lead : leadsNew){
            /* Make sure we don't treat an enamil address that
               isn't changing during an update as a duplicate. */
            if((lead.email != null) 
                // Make sure another new lead isn't also a duplicate
                &&(leadMap.containsKey(lead.Email))){
                    lead.Email.addError('Another new lead has the same email address');
                    }
                    else {
                    leadMap.put(lead.Email, lead);
                    }
                
        }
        repetedEmail(leadMap);
         
    }

    public static void repetedEmail(Map<String, Lead> leadMap){
        /* Using a single database query, find all the leads in
           the database that have the same email address as any
           of the leads being inserted or updated */
           Set <String> setByMap = new Set<String>();
           setByMap = leadMap.keySet();
           List <Lead> leads = new List <Lead>();
           leads = [
                   SELECT Id,email
                   FROM Lead
                   WHERE email IN :setByMap
           ];                    
           for (Lead lead : leads) {
            //Lead newLead = leadMap.get(lead.Email);
            //if(leadMap.containsKey(lead.email)){
                Lead newLead = leadMap.get(lead.Email);
                newLead.addError('A lead with this email address already exists');
            //}    
            } 
    } 

    public static void verifyUpdateAnyFields(List<Lead> leadsNew,Map<Id,Lead> leadsOld){
        List<String> emailRepeat = new List<String>();
        Map<String,Lead> leadByEmail = new Map<String,Lead>();
        for(Lead leadNew : leadsNew){
            if(!emailRepeat.contains(leadNew.email)){
                emailRepeat.add(leadnew.Email);
            }
            else{
                leadNew.addError('Another new lead has the same email address');
            }
            //Lead leadOld = leadsOld.get(leadNew.Id);
            if (!leadNew.email.equals(leadsOld.get(leadNew.Id).email)){
                //leadsToUpdate.add(leadNew);
                leadByEmail.put(leadnew.email,leadNew);
            }
        }
            repetedEmail(leadByEmail);
            //update leadsToUpdate;
    }  
  
   

}