from sqlalchemy import update

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


def get_customers():
    return session.query(Customer).all()


def get_customer_by_id(customer_id):
    return session.query(Customer).filter(Customer.customer_id == customer_id).first()


def update_customer_name(customer, new_customer_name):
    customer.customer_name = new_customer_name
    session.commit()


def update_contact_name(customer, new_contact_first_name, new_contact_last_name):
    customer.contact_first_name = new_contact_first_name
    customer.contact_last_name = new_contact_last_name
    session.commit()


def update_contact_phone_number(customer, new_phone_number):
    customer.phonenumber = new_phone_number
    session.commit()


def update_customer_address(customer_id, new_address_id, old_address_id):
    sql = f"UPDATE customers_have_addresses SET address_id = {new_address_id} WHERE  customer_id={customer_id} and " \
          f"address_id = {old_address_id};"
    session.execute(sql)
    session.commit()

