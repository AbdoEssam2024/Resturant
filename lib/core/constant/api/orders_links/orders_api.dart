class OrdersApi {
  static String ordersServer = "http://10.0.2.2/resuturant_anj/orders/";
  static String activeOrders = "${ordersServer}active_orders.php";
  static String completeOrders = "${ordersServer}complete_orders.php";
  static String cancelOrders = "${ordersServer}canceled_orders.php";
  static String changeOrdersStatus = "${ordersServer}change_order_status.php";
  static String ordersItems = "${ordersServer}orders_items.php";
  static String deleteOrderItem = "${ordersServer}delete_order_item.php";
}