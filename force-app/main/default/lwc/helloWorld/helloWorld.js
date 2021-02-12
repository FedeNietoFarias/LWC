import { LightningElement } from 'lwc';
export default class HelloWorld extends LightningElement {
    text = ''; 
 greeting = 'World';
 show = true;
  
 
  changeHandler(event) {
    this.greeting = event.target.value;
  }
  
  handleChange(event){
      this.text = event.target.value;
   }
   
    handleClick(){
        this.show = !this.show;
        //ejemplo de OBJETO LITERAL, objetos UNICOS
        const bike = {
            "gears": 10,
            "currentGear": 3,
            changeGear: function(direction, changeBy) {
              if (direction === 'up') {
                this.currentGear += changeBy;
              } else {
                this.currentGear -= changeBy;
              }
            }
          }
          console.log(bike.gears); // 10
          console.log(bike.currentGear); //3
          bike.changeGear('up', 1);
          console.log(bike.currentGear); //4

          //Ejemplo de clase creada con constructor
          class Bike {
            constructor(gears, startGear){
                this.gears = gears;
                this.currentGear = startGear;
            }
            changeGear(direction, changeBy) {
                if (direction === 'up') {
                    this.currentGear += changeBy;
                } else {
                    this.currentGear -= changeBy;
                }
            }
        }
        const bikez = new Bike(10, 5);
        console.log(bike.currentGear); // 5
        bike.changeGear('up', 2);
        console.log(bike.currentGear); // 7

          //ejemplo de objeto creado con CONSTRUCTOR, se pueden crear MAS DE UNA INSTANCIA DE ESE MISMO OBJETO
          function Bikes(gears, startGear) {
            this.gears = gears;
            this.currentGear = startGear;
          }
          Bike.prototype.changeGear = function(direction,changeBy){
            //con el .prototype la funcion es heredada para todos las instancias del objeto
            if(direction === 'up') {
              this.currentGear += changeBy;
            } else {
              this.currentGear -= changeBy;
            }
          }
          const bikes = new Bike(10, 3);
          console.log(bike.gears); // 10
          console.log(bike.currentGear); //3
          bike.changeGear('up', 1);
          console.log(bike.currentGear); //4



    }
          //Ejemplo JSON
            yohan = {
                "altura" : 2.05,
                "nacionalidad" : 'Venezolano'
                
            }

            // call function
          //let gearRatio = calculateGearRatio(42, 30);
          // function is declared after the line it is called
          // this is allowed in function declaration
          /*function calculateGearRatio(driverGear, drivenGear){
            return (driverGear / drivenGear);
          }
          console.log(gearRatio); // 1.4*/
            
          /*let myArray = [1, 5, 11, 17];
          let newArray = myArray.map( function(item){ return item / 2 } );
          console.log(newArray); // [0.5, 2.5, 5.5, 8.5]
          En este fragmento, myArray.maptoma un único parámetro: una función que se ejecuta una vez por elemento en myArray. */

          /*var handleClick = function(event) {
            console.log(event.type);  // click
            console.log(event.currentTarget); // the thing you clicked
            console.log(event.screenX); // screen X coordinate
            console.log(event.screenY); // screen Y coordinate
          }*/
          
          workWithId(){
            //normal function
                let button = document.getElementById("clicker");
                button.addEventListener("click", handleClick);
                button.removeEventListener("click", handleClick);//remove the event
            //anonymous function
                button.addEventListener("click", function(event){
                  //...anonymous function body...
                 });//no se puede usar el REMOVE ya que no tiene un puntero (Id) de donde remover    
          }


          /*PROMISE WITH RESOLVE AND REJECT
          Bike.prototype.changeGearAsync = function(shiftObject){
            return new Promise(
              (resolve, reject) => {
                let newIndex = shiftObject.currentIndex + shiftObject.changeBy;
                if (newIndex < 0 || newIndex > shiftObject.maxIndex) {
                  reject("New Index is Invalid: " + newIndex);
                } else {
                  resolve(newIndex);
                }
              }
            );
          };*/

          /* PROMISE WITH 2 THEN AND CATCH
          Bike.prototype.changeBothGears = function(frontChange, rearChange) {
            let shiftFront = {
              currentIndex: this.frontGearIndex,
              maxIndex: this.transmission.frontGearTeeth.length - 1,
              changeBy: frontChange
            };
            let shiftRear = {
              currentIndex: this.rearGearIndex,
              maxIndex: this.transmission.rearGearTeeth.length - 1,
              changeBy: rearChange
            };
            this.changeGearAsync(shiftFront)
              .then(
                (newIndex) => {
                  this.frontGearIndex = newIndex;
                  console.log(this.calculateGearRatio());
                  return this.changeGearAsync(shiftRear);
                }
              )
              .then(
                (newIndex) => {
                  this.rearGearIndex = newIndex;
                  console.log(this.calculateGearRatio());
                }
              )
              .catch(
                (err) => {console.log("Error: " + err);}
              );
            };*/

            


    
}