public with sharing class ObjectGraphSVC {


    public static scheme getSchema(){

        scheme scheme = new scheme();

        List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();

        for(Schema.SObjectType ot: gd){
            Schema.DescribeSObjectResult parent = ot.getDescribe();
            scheme.nodes.add(new node(parent.getName(),parent.getLabel()));

            for(Schema.ChildRelationship cr: ot.getDescribe().getChildRelationships() ){
                //system.debug(cr);
                Schema.DescribeSObjectResult child = cr.getChildSObject().getDescribe();
                edge e = new edge(parent.getName(), child.getName() );
                scheme.edges.add(e);
            }
        }
        return scheme;
    }

    public class scheme {
        public node[] nodes {get;set;}
        public edge[] edges {get;set;}
        public scheme(){
            this.edges = new edge[]{};
            this.nodes = new node[]{};
        }
    }

    public class node{
        public String label {get;set;}
        public String id {get;set;}
        public node(string id, string label){
            this.id = id;
            this.label = label;
        }
    }
    public class edge{
        public String to {get;set;}
        public String fro {get;set;}
        public edge(String to, String fro){
            this.to = to;
            this.fro = fro;
        }
    }
}