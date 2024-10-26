public class OrderManager {
    
    // Method to set the Order Status based on Order Amount
    public void setOrderStatus(List<Order> orders) {
        for (Order ord : orders) {
            if (ord.Total_Amount__c >= 10000) {
                ord.Status__c = 'High Value';
            } else if (ord.Total_Amount__c >= 5000) {
                ord.Status__c = 'Standard';
            } else {
                ord.Status__c = 'Low Value';
            }
        }
        
        // Update orders in the database
        update orders;
    }
}