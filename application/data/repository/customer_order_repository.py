from application.data.db import session
from application.data.models import CustomerOrder, OrderDetail


def get_customer_orders():
    return session.query(CustomerOrder).all()


def get_customer_orders_by_customer_id(customer_id):
    return session.query(CustomerOrder).filter(CustomerOrder.customer_id == customer_id).all()


def create_customer_order(customer_order):
    customer_order = CustomerOrder(**customer_order)
    session.add(customer_order)
    session.commit()


def create_order_details(order_details):
    order_details = OrderDetail(**order_details)
    session.add(order_details)
    session.commit()


def get_order_details_by_order_number(order_number):
    return session.query(OrderDetail).filter(OrderDetail.customer_order_number == order_number).first()


def get_customer_orders_by_order_number(order_number):
    return session.query(CustomerOrder).filter(CustomerOrder.customer_order_number == order_number).first()


def update_product(order_details, new_product_id):
    order_details.product_number = new_product_id
    session.commit()


def update_price(order_details, new_price):
    order_details.price_each = new_price
    session.commit()


def update_quantity(order_details, new_quantity):
    order_details.quantity_ordered = new_quantity
    session.commit()


def update_customer(order, new_customer_id):
    order.customer_id = new_customer_id
    session.commit()


def update_store(order, new_store_id):
    order.store_id = new_store_id
    session.commit()


def update_employee(order, new_employee_id):
    order.employee_id = new_employee_id
    session.commit()


def add_shipped_date(order, shipped_date):
    order.shipped_date = shipped_date
    session.commit()


def update_status(order, new_status):
    order.status = new_status
    session.commit()


def update_comments(order, comments):
    order.comments = comments
    session.commit()
