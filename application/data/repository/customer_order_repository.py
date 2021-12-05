from application.data.db import session
from application.data.models import CustomerOrder


def get_customer_orders():
    return session.query(CustomerOrder).all()


def place_order(customer_order):
    customer_order = CustomerOrder(**customer_order)
    session.add(customer_order)
    session.commit()
