@isTest
public class AccountManagerTest {
    @isTest static void testUpdateAccountDescription() {
        // Create a test Account
        Account testAccount = new Account(Name='Test Account', Description='Initial Description');
        insert testAccount;
        
        // Test updating the description
        Test.startTest();
        Account updatedAccount = AccountManager.updateAccountDescription(testAccount.Id, 'Updated Description');
        Test.stopTest();
        
        // Retrieve the updated Account from the database
        Account resultAccount = [SELECT Description FROM Account WHERE Id = :testAccount.Id];
        
        // Assert that the description was updated correctly
        System.assertEquals('Updated Description', resultAccount.Description, 'The account description should be updated.');
    }
}