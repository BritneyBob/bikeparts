from application.data.repository import customer_repository


def create_customer(customer):
    customer_repository.create_customer(customer)


def create_customer_address(customer, address):
    customer_repository.create_customer_address(customer, address)


def get_customers():
    return customer_repository.get_customers()
