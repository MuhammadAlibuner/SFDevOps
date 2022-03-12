public class theController {

    String searchText;
    List<Lead> results;

    public String getSearchText() {
       // system.debug('getSearchText called'+ searchText);
        return searchText;
    }

    public void setSearchText(String s) {
        //system.debug(s);
        searchText = s;
    }

    public List<Lead> getResults() {
        return results;
    }

    public PageReference doSearch() {
        results = (List<Lead>)[FIND :searchText RETURNING Lead(Name, Email, Phone)][0];
        return null;
    }
}