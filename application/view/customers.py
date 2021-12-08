from application.controllers import customer_controller, address_controller
from application.view import options


def print_customer_info(customer):
    print(f"{customer.customer_id}:\t", end='')
    if customer.customer_name:
        print(f"{customer.customer_name}\t", end='')
        print(f"Contact: {customer.contact_last_name}, {customer.contact_first_name}\t", end="")
    else:
        print(f"Name: {customer.contact_last_name}, {customer.contact_first_name}\t", end="")
    addresses = customer.addresses
    for address in addresses:
        print(f"{address.address_type.address_type_name.capitalize()}: {address.address_line2}, {address.zipcode} "
              f"{address.city_name}, {address.country_name}\t", end="")
    print(f"Phone number: {customer.phonenumber}\t")


def show_all_customers():
    customers = customer_controller.get_customers()
    print("All customers: ")
    for customer in customers:
        print_customer_info(customer)


def insert_new_address_info(address_type, customer_id, customer):
    new_address_line2 = input("Please enter new street address: ")
    new_zipcode = input("Please enter new zipcode: ")
    new_city = input("Please enter new city: ")
    new_country = input("Please enter new country: ")
    address = {
        "address_type_id": address_type,
        "address_line1": None,
        "address_line2": new_address_line2,
        "zipcode": new_zipcode,
        "city_name": new_city,
        "country_name": new_country
    }
    # address_controller.create_address(address)
    customer_address = {"customer_id": customer_id, "address_id": customer.addresses}
    # customer_controller.create_customer_address(customer_address)


def update_customer():
    customer_id = input("Please enter the customer id of the customer you would like to update information for: ")
    customer = customer_controller.get_customer_by_id(customer_id)
    print_customer_info(customer)

    print("1. Name of company")
    print("2. Name of private customer or company contact")
    print("3. Delivery address")
    print("4. Billing address")
    print("5. Phone number")
    print()
    print("9. Back to customer menu")
    print()
    while True:
        choice = input("What would you like to change (1-4): ")
        if choice in "123459" and len(choice) == 1:
            break
        print("Valid options are 1, 2, 3, 4, 5 or 9")

    match choice:
        case "1":
            new_customer_name = input("Please enter new name: ")
            customer_controller.update_customer_name(customer, new_customer_name)
        case "2":
            new_contact_first_name = input("Please enter new first name: ")
            new_contact_last_name = input("Please enter new last name: ")
            customer_controller.update_contact_name(customer, new_contact_first_name, new_contact_last_name)
        case "3":
            address_type = 1
            insert_new_address_info(address_type, customer_id, customer)
        case "4":
            address_type = 2
            insert_new_address_info(address_type, customer_id, customer)
        case "5":
            new_phone_number = input("Please enter new phone number: ")
            customer_controller.update_contact_phone_number(customer, new_phone_number)
        case "9":
            options.customer_menu()

    print("The customer was updated with the new information: ")
    updated_customer = customer_controller.get_customer_by_id(customer_id)
    print_customer_info(updated_customer)
