from application.data.repository import customer_order_repository


def get_customer_orders():
    return customer_order_repository.get_customer_orders()
