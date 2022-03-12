public class TrainingPageController {
    public list<FavHerioneWrapper> lstWrap {get;set;}
    public FavHerioneWrapper objFavHeo {get;set;} //initialize
    //constructor
    public TrainingPageController(){
        lstWrap = new List<FavHerioneWrapper>();
        objFavHeo = new FavHerioneWrapper();
        objFavHeo.sName = 'Sunny leone';
        objFavHeo.intAge=35;
        objFavHeo.isMaried=true;
        objFavHeo.decHeight = 5.7;
        lstWrap.add(objFavHeo);
        
       FavHerioneWrapper objFavHeol = new FavHerioneWrapper();
        objFavHeol.sName = 'Deepika padukone';
        objFavHeol.intAge=33;
        objFavHeol.isMaried=true;
        objFavHeol.decHeight = 5.8;
        lstWrap.add(objFavHeol);
    }
	///Wrapper Class
    public class FavHerioneWrapper{
        public String sName {get;set;}
        public Integer intAge {get;set;}
        public Boolean isMaried {get;set;}
        public Decimal decHeight {get;set;}
    }
}