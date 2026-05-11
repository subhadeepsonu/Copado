public with sharing class StringListTest {
    public static  List<String>  generateStringList(Integer N) {
        List<String> stringList = new List<String>();
        for(Integer i=0;i<N;i++){
            stringList.add('Test '+i);
        }
        return stringList;
    }
}