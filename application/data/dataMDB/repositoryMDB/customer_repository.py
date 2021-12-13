from application.data.dataMDB import modelsMDB as mm


def create_customer(customer):
    customer = mm.Customer(**customer)
    customer.save()


def create_customer_address(customer, address):
    customer.address


def get_customers():
    return mm.Customer.all()


def get_customer_by_id(customer_id):
    return mm.Customer.find(customer_id=customer_id).first_or_none()


def update_customer_name(customer, new_customer_name):
    customer.customer_name = new_customer_name
    customer.save()


def update_contact_name(customer, new_contact_first_name, new_contact_last_name):
    customer.contact_first_name = new_contact_first_name
    customer.contact_last_name = new_contact_last_name
    customer.save()


def update_contact_phone_number(customer, new_phone_number):
    customer.phonenumber = new_phone_number
    customer.save()


# def update_customer_address(customer_id, new_address_id, old_address_id):
#     sql = f"UPDATE customers_have_addresses SET address_id = {new_address_id} WHERE  customer_id={customer_id} and " \
#           f"address_id = {old_address_id};"
#     session.execute(sql)
#     session.commit()

