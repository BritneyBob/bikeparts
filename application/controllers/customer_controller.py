from application.data.repository import customer_repository


def create_customer(customer):
    customer_repository.create_customer(customer)


def create_customer_address(customer, address):
    customer_repository.create_customer_address(customer, address)


def get_customers():
    return customer_repository.get_customers()


def get_customer_by_id(customer_id):
    return customer_repository.get_customer_by_id(customer_id)


def update_customer_name(customer, new_customer_name):
    return customer_repository.update_customer_name(customer, new_customer_name)


def update_contact_name(customer, new_contact_first_name, new_contact_last_name):
    return customer_repository.update_contact_name(customer, new_contact_first_name, new_contact_last_name)


def update_contact_phone_number(customer, new_phone_number):
    return customer_repository.update_contact_phone_number(customer, new_phone_number)


def update_customer_address(customer, new_address_id, old_address_id):
    return customer_repository.update_customer_address(customer, new_address_id, old_address_id)
