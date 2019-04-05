public class NewCaseListController {
    
    private String stat = 'New';
    
    public List<Case> getNewCases() {
        List<Case> results = Database.query(
            'SELECT Id, CaseNumber FROM Case WHERE Status =: stat'
        );
        return results;
    }

}