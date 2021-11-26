from application.data.repository import customer_repository


def create_customer(customer):
    customer_repository.create_customer(customer)
