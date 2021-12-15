from application.data.dataMDB.modelsMDB import Customer


def create_customer(customer):
    Customer(customer).save()


def create_customer_address(customer, new_address):
    for address in customer.addresses:
        if new_address["address_type"] == address["address_type"]:
            address = new_address
            customer.save()


def get_customers():
    return Customer.all()


def get_customer_by_id(customer_id):
    return Customer.find(customer_id=customer_id).first_or_none()


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


def get_customers_cars(customer_id):
    x = session.query(CustomerCar).filter(CustomerCar.customer_id == customer_id).all()
    return x
