import { LightningElement,api, track } from 'lwc';

export default class Calculator extends LightningElement {
    numbers=[];
    handleClick(event){
       console.log('ENTROOO');
       var operator=event.target.label;
       var number;
       
       console.log(operator);
       if(operator==='/'){

       }

       else if(operator ==='*'){

       }

       else if(operator ==='-'){
           
        }

       else if(operator ==='+'){
           
        }

       else if(operator ==='+'){
           
        }

        else{
            number = parseInt(operator,10);
            
            this.numbers = [...this.numbers, number];
            
        }
        
        console.log(this.numbers);
        

    }
    
}