public class AccountManager {
    // Method to update the description of an Account
    public static Account updateAccountDescription(Id accountId, String newDescription) {
        // Retrieve the Account based on the Id provided
        Account acc = [SELECT Id, Description FROM Account WHERE Id = :accountId LIMIT 1];
        
        // Update the description
        acc.Description = newDescription;
        
        // Update the Account record
        update acc;
        
        return acc;
    }
}