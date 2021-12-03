from application.data.db import session
from application.data.models import Customer, customers_have_addresses_table


def create_customer(customer):
    customer = Customer(**customer)
    session.add(customer)
    session.commit()


def create_customer_address(customer, address):
    statement = customers_have_addresses_table.insert().values(customer_id=customer, address_id=address)
    session.execute(statement)
    session.commit()

