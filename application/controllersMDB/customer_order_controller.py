from application.dataMDB.repositoryMDB import customer_order_repository


def create_customer_order(customer_order):
    customer_order_repository.create_customer_order(customer_order)


def get_customer_orders():
    return customer_order_repository.get_customer_orders()


def get_customer_orders_by_old_customer_id(customer_id):
    return customer_order_repository.get_customer_orders_by_old_customer_id(customer_id)


def get_customer_orders_by_customer_id(customer_id):
    return customer_order_repository.get_customer_orders_by_customer_id(customer_id)


def get_customer_order_by_order_number(order_number):
    return customer_order_repository.get_customer_order_by_order_number(order_number)


def add_shipped_date(order, shipped_date):
    customer_order_repository.add_shipped_date(order, shipped_date)


def update_status(order, new_status):
    customer_order_repository.update_status(order, new_status)


def update_comments(order, comments):
    customer_order_repository.update_comments(order, comments)


# def get_order_details_by_order_number(order_number):
#     return customer_order_repository.get_order_details_by_order_number(order_number)

# def add_order_details(order_details):
#     customer_order_repository.add_order_details(order_details)
