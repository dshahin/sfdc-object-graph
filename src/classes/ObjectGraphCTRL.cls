public with sharing class ObjectGraphCTRL {

    @remoteAction
    public static ObjectGraphSVC.scheme getSchema(){
        return ObjectGraphSVC.getSchema();
    }
}