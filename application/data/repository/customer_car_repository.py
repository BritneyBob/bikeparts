from application.data.db import session
from application.data.models import CustomerCar


def create_customer_car(customer_car):
    customer_car = CustomerCar(**customer_car)
    session.add(customer_car)
    session.commit()


def get_customers_cars(customer_id):
    # return session.query(CustomerCar).filter(CustomerCar.customer_id == customer_id).all()
    return session.query(CustomerCar).all()
