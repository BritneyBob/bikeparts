from application.data.repository import customer_order_repository


def get_customer_orders():
    return customer_order_repository.get_customer_orders()


def create_customer_order(customer_order):
    customer_order_repository.create_customer_order(customer_order)


def get_customer_orders_by_customer_id(customer_id):
    return customer_order_repository.get_customer_orders_by_customer_id(customer_id)


def create_order_details(order_details):
    return customer_order_repository.create_order_details(order_details)