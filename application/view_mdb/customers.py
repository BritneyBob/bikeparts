from application.controllersMDB import customer_controller
# from application.view_mdb import options


def print_customer_info(customer):
    print(f"{customer._id}:\t", end='')
    try:
        print(f"Name: {customer.customer_name}\t", end='')
        print(f"Contact: {customer.contact_last_name}, {customer.contact_first_name}\t", end="")
    except AttributeError:
        print(f"Name: {customer.contact_last_name}, {customer.contact_first_name}\t", end="")
    for address in customer.addresses:
        print(f"{address['address_type'].capitalize()}: {address['street_address']}, {address['zipcode']} "
              f"{address['city']}, {address['country']}\t", end="")
    print(f"Phone number: {customer.phonenumber}\t")


def show_all_customers():
    customers = customer_controller.get_customers()
    print("All customers: ")
    for customer in customers:
        print_customer_info(customer)


def insert_new_address_info(address_type, customer):
    new_address_line2 = input("Please enter new street address: ")
    new_zipcode = input("Please enter new zipcode: ")
    new_city = input("Please enter new city: ")
    new_country = input("Please enter new country: ")
    address = {
        "address_type": address_type,
        "street_address": new_address_line2,
        "zipcode": new_zipcode,
        "city": new_city,
        "country": new_country
    }

    customer_controller.update_customer_address(customer, address)


def print_new_info(customer_id):
    print("The customer was updated with the new information: ")
    updated_customer = customer_controller.get_customer_by_id(customer_id)
    print_customer_info(updated_customer)


def update_customer():
    valid_id = False
    customer_id = 0
    customer = None
    while not valid_id:
        customer_id = int(input("Please enter the customer id of the customer you would like to update information "
                                "for: "))
        if customer_id > len(customer_controller.get_customers()):
            print("Customer does not exist. Please enter another id.")
        else:
            customer = customer_controller.get_customer_by_id(customer_id)
            print_customer_info(customer)
            valid_id = True

    print(50 * "*")
    print("Change customer info")
    print(50 * "*")
    print("1. Name of company")
    print("2. Name of private customer or company contact")
    print("3. Delivery address")
    print("4. Billing address")
    print("5. Phone number")
    print()
    print("9. Back to customer menu")
    print()
    while True:
        choice = input("What would you like to change (1-5): ")
        if choice in "123459" and len(choice) == 1:
            break
        print("Valid options are 1, 2, 3, 4, 5 or 9")

    match choice:
        case "1":
            try:
                if customer.customer_name:
                    new_customer_name = input("Please enter new name: ")
                    customer_controller.update_customer_name(customer, new_customer_name)
                    print_new_info(customer_id)
            except AttributeError:
                print("Can't change name of company of private customer!")
        case "2":
            new_contact_first_name = input("Please enter new first name: ")
            new_contact_last_name = input("Please enter new last name: ")
            customer_controller.update_contact_name(customer, new_contact_first_name, new_contact_last_name)
            print_new_info(customer_id)
        case "3":
            insert_new_address_info("delivery address", customer)
            print_new_info(customer_id)
        case "4":
            insert_new_address_info("billing address", customer)
            print_new_info(customer_id)
        case "5":
            new_phone_number = input("Please enter new phone number: ")
            customer_controller.update_contact_phone_number(customer, new_phone_number)
            print_new_info(customer_id)
        case "9":
            pass
