@isTest
public class ContactManagerTest {
    @isTest static void testUpdateContactDescription() {
        // Create a test contact
        Contact testContact = new Contact(
            FirstName = 'John',
            LastName = 'Doe',
            Email = 'john.doe@example.com'
        );
        insert testContact;

        // Call the method under test
        ContactManager.updateContactDescription(new List<Contact>{testContact}, 'Updated Description');

        // Retrieve the updated contact from the database
        testContact = [SELECT Description FROM Contact WHERE Id = :testContact.Id];

        // Assert that the description was updated correctly
        System.assertEquals('Updated Description', testContact.Description, 'The description should be updated.');
    }
}