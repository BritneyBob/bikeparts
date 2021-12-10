from application.data.repository import customer_order_repository


def get_customer_orders():
    return customer_order_repository.get_customer_orders()


def create_customer_order(customer_order):
    customer_order_repository.create_customer_order(customer_order)


def get_customer_orders_by_customer_id(customer_id):
    return customer_order_repository.get_customer_orders_by_customer_id(customer_id)


def create_order_details(order_details):
    return customer_order_repository.create_order_details(order_details)


def get_order_details_by_order_number(order_number):
    return customer_order_repository.get_order_details_by_order_number(order_number)


def get_customer_orders_by_order_number(order_number):
    return customer_order_repository.get_customer_orders_by_order_number(order_number)


def update_product(order_details, new_product_number):
    return customer_order_repository.update_product(order_details, new_product_number)


def update_price(order_details, new_price):
    return customer_order_repository.update_price(order_details, new_price)


def update_quantity(order_details, new_quantity):
    return customer_order_repository.update_quantity(order_details, new_quantity)


def update_customer(order, new_customer_id):
    return customer_order_repository.update_customer(order, new_customer_id)


def update_store(order, new_store_id):
    return customer_order_repository.update_store(order, new_store_id)


def update_employee(order, new_employee_id):
    return customer_order_repository.update_employee(order, new_employee_id)


def add_shipped_date(order, shipped_date):
    return customer_order_repository.add_shipped_date(order, shipped_date)


def update_status(order, new_status):
    return customer_order_repository.update_status(order, new_status)


def update_comments(order, comments):
    return customer_order_repository.update_comments(order, comments)
