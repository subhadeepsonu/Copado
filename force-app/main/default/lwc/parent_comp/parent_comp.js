import { LightningElement } from 'lwc';

export default class Parent_comp extends LightningElement {
    msg='';
    click(event){
        this.msg = event.detail.msg
    }
}