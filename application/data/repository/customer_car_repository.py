from application.data.db import session
from application.data.models.customer_car import CustomerCar


def create_customer_car(customer_car):
    customer_car = CustomerCar(**customer_car)
    session.add(customer_car)
    session.commit()
