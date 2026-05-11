public class DogBreadsWrapperClass {
    public List<data> data;

    public class attributes {
        public String name;
        public String description;
        public Boolean hypoallergenic;
    }

    public class data {
        public String id;
        public String type;
        public attributes attributes;
    }

    public static DogBreadsWrapperClass parse(String json) {
        return (DogBreadsWrapperClass) System.JSON.deserialize(json, DogBreadsWrapperClass.class);
    }
}