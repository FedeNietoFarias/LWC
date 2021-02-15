import { LightningElement,wire } from 'lwc';
import FIRSTNAME_CONTACT from '@salesforce/schema/Contact.FirstName';
import LASTNAME_CONTACT from '@salesforce/schema/Contact.LastName';
import EMAIL_CONTACT from '@salesforce/schema/Contact.Email';
import getContacts from '@salesforce/apex/contactController.getContacts';
import { reduceErrors } from 'c/ldsUtils';
const COLUMNS=[
    {label: 'First Name', fieldName: FIRSTNAME_CONTACT.fieldApiName,type:'text'},
    {label:'Last Name',fieldName:LASTNAME_CONTACT.fieldApiName,type:'text'},
    {label:'Email',fieldName:EMAIL_CONTACT.fieldApiName,type:'email'}
];
export default class ContactList extends LightningElement {
    columns=COLUMNS;
    @wire(getContacts)
    contacts;
    get errors() {
        return (this.accounts.error) ?
            reduceErrors(this.accounts.error) : [];
    }
}