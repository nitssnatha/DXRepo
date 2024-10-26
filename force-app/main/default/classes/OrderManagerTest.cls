@isTest
private class OrderManagerTest {

    @isTest
    static void testSetOrderStatus() {
        // Create test orders with varying Total_Amount__c values
        Order ord1 = new Order(Name = 'Order High', Total_Amount__c = 12000, Status__c = 'Pending');
        Order ord2 = new Order(Name = 'Order Standard', Total_Amount__c = 6000, Status__c = 'Pending');
        Order ord3 = new Order(Name = 'Order Low', Total_Amount__c = 2000, Status__c = 'Pending');
        
        // Insert test orders
        insert new List<Order>{ord1, ord2, ord3};

        // Retrieve the orders after insert to ensure they are in memory and have IDs
        List<Order> orders = [SELECT Id, Name, Total_Amount__c, Status__c FROM Order WHERE Id IN :new List<Id>{ord1.Id, ord2.Id, ord3.Id}];
        
        // Invoke the method to set the Status based on Total_Amount__c
        OrderManager orderManager = new OrderManager();
        orderManager.setOrderStatus(orders);

        // Retrieve the updated orders to verify Status values
        orders = [SELECT Id, Name, Total_Amount__c, Status__c FROM Order WHERE Id IN :new List<Id>{ord1.Id, ord2.Id, ord3.Id}];

        // Assert the expected outcomes for each order
        System.assertEquals('High Value', orders[0].Status__c, 'Order with high total amount should be marked as High Value.');
        System.assertEquals('Standard', orders[1].Status__c, 'Order with medium total amount should be marked as Standard.');
        System.assertEquals('Low Value', orders[2].Status__c, 'Order with low total amount should be marked as Low Value.');
    }
}