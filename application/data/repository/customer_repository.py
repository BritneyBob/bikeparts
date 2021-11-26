from application.data.db import session
from application.data.models.customer import Customer


def create_customer(customer):
    customer = Customer(**customer)
    session.add(customer)
    session.commit()

