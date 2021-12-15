from application.data.dataMDB.repositoryMDB import customer_repository


def create_customer(customer):
    customer_repository.create_customer(customer)


def get_customers():
    return customer_repository.get_customers()


def get_customer_by_id(customer_id):
    return customer_repository.get_customer_by_id(customer_id)


def update_customer_name(customer, new_customer_name):
    customer_repository.update_customer_name(customer, new_customer_name)


def update_contact_name(customer, new_contact_first_name, new_contact_last_name):
    customer_repository.update_contact_name(customer, new_contact_first_name, new_contact_last_name)


def update_contact_phone_number(customer, new_phone_number):
    customer_repository.update_contact_phone_number(customer, new_phone_number)


def update_customer_address(customer, new_address):
    customer_repository.update_customer_address(customer, new_address)
