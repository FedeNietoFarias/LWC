public with sharing class TLeadTriggerHandler {
    public static void VerifyRepetedMail(List<Lead> listNew){   
        List<String> emailList = new List <String>();
        for(Lead getMail  : listNew){
            emailList.add(getMail.email);
        }
        List <Lead> repetedEmailLead = new List <Lead>();
        repetedEmailLead = [SELECT Id,email
                            FROM Lead
                            WHERE email IN :emailList
                            ];
        Map<String, Lead> mapName = new Map<String, Lead>();
        for(Lead ld : repetedEmailLead){
            if(!mapName.containsKey(ld.email)){
                mapName.put(ld.email,ld);
            }
        }

                                            
        for(Lead leadNew : listNew){
            //for(Lead repEmail : repetedEmailLead){
                if(mapName.containsKey(leadNew.email)){
                   leadNew.addError('Cannot insert a lead with an existing email');
                }
            //}
            
        }                    

        /*for(Lead mail : listNew){
            //for(Lead repEmail : repetedEmailLead){
                if(repEmail.email.equals(mail.email)){
                   mail.addError('Cannot insert a lead with an existing email');
                }
            //}
            
        }*/
    }
}
