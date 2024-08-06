public class ContactManager {
    // Method to update the description of a Contact
    public static void updateContactDescription(List<Contact> contacts, String newDescription) {
        for (Contact contact : contacts) {
            contact.Description = newDescription;
        }
        update contacts;
    }
}