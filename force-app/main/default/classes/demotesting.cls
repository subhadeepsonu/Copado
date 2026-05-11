public with sharing class demotesting {
    public Integer multiply(Integer a, Integer b){
        return a*b;
    }
    public void updateCase(Case c){
        c.Status = 'New';
        update c;
    }   
}