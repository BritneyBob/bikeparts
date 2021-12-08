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
