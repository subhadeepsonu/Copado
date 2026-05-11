import { LightningElement } from 'lwc';

export default class Child_comp extends LightningElement {
    handleClick() {
        const event = new CustomEvent('buttonclick',{
            detail:{
                msg:'Hello from child component'
            }
        })
        this.dispatchEvent(event);
    }
}