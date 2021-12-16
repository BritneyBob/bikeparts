from application.controllersMDB import company_controller, store_controller, product_controller
from application.view_mdb import options


def negotiate_supplier_prices():
    id_and_buy_price = []
    comp_and_supp_id = {"company_id": 0, "supplier_id": 0}
    print("List of our suppliers:")
    # TODO: Change company id to something else, enums?
    suppliers = company_controller.get_suppliers()
    for supplier in suppliers:
        print(f"Company id: {supplier.company_id}, Company name: {supplier.company_name}")

    _id = int(input("Please choose the company id for the company you want to negotiate with: "))  # Validate company_id
    comp_and_supp_id["company_id"] = _id
    for supplier in suppliers:
        if supplier.company_id == _id:
            company_name = supplier.company_name
            # comp_and_supp_id["supplier_id"] = supplier.company_id

            # TODO: Change product_number to something else, enums?
            print(f"\nThese are the products that the company {company_name} sells to you: ")
            for product in supplier.supplies_products:
                print(f"Product id: {product.product_number}, Product name: {product.spare_part.name}, "
                      f"Current buy price: {product.buy_price}")
                id_and_buy_price.append({"product_number: ": product.product_number,
                                         "name: ": product.spare_part.name, "buy_price: ": product.buy_price})
            break

    new_buy_prices = company_controller.negotiation(id_and_buy_price, comp_and_supp_id)
    print('*' * 50)
    print("Product list with updated prices:")
    for i in range(len(id_and_buy_price)):
        print(f"Product id: {id_and_buy_price[i]['product_number: ']}, Product name: {id_and_buy_price[i]['name: ']}, "
              f"New buy price: {new_buy_prices[i]}")


def print_company_info(company):

    print(f"\nCompany name: {company.company_name}")
    print(f"Company id: {company._id}")
    print(f"\nCompany contact mail: {company.contact_email}")
    print(f"Company contact phone number: {company.contact_phonenumber}\n")
    for address in company.addresses:
        print(f"{address['address_tye'].capitalize()}: {address['street_address']}\t {address['zipcode']} "
              f"{address.city}\t {address.country}")


def view_companies():
    companies = company_controller.get_all_companies()
    print("All companies: ")
    for company in companies:
        print(f"Company id: {company._id}, Company name: {company.company_name}, Company type: {company.company_type}")

    company_id = int(input("Please choose the company id for the company you want to see information about: "))
    for company in companies:
        if company.company_id == company_id:
            print_company_info(company)


def insert_new_address_info(address_type, company):
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
    # TODO: This doesn't work. Ask for help!
    company_controller.update_company_address(company, address)


def print_new_info(company_id):
    print("The company was updated with the new information: ")
    updated_company = company_controller.get_company_by_id(company_id)
    print_company_info(updated_company)


def update_company():
    valid_id = False
    company_id = 0
    company = None
    while not valid_id:
        company_id = int(input("Please enter the company id of the company you would like to update information for: "))
        if company_id > len(company_controller.get_all_companies()):
            print("Company does not exist. Please enter another id.")
        else:
            company = company_controller.get_company_by_id(company_id)
            print_company_info(company)
            valid_id = True

    print(50 * "*")
    print("1. Name of company")
    print("2. Visiting address")
    print("3. Delivery address")
    print("4. Billing address")
    print("5. Name and e-mail of contact")
    print("6. Contact phone number")
    print()
    print("9. Back to company menu")
    print()
    while True:
        choice = input("What would you like to change (1-6): ")
        if choice in "123459" and len(choice) == 1:
            break
        print("Valid options are 1, 2, 3, 4, 5, 6 or 9")

    match choice:
        case "1":
            new_company_name = input("Please enter new name: ")
            company_controller.update_company_name(company, new_company_name)
            print_new_info(company_id)
        case "2":
            insert_new_address_info("visiting address", company)
            print_new_info(company_id)
        case "3":
            insert_new_address_info("delivery address", company)
            print_new_info(company_id)
        case "4":
            insert_new_address_info("billing address", company)
            print_new_info(company_id)
        case "5":
            new_contact_first_name = input("Please enter new first name: ")
            new_contact_last_name = input("Please enter new last name: ")
            company_controller.update_contact_name(company, new_contact_first_name, new_contact_last_name)
            print_new_info(company_id)
        case "6":
            new_phone_number = input("Please enter new phone number: ")
            company_controller.update_contact_phone_number(company, new_phone_number)
            print_new_info(company_id)
        case "9":
            options.procurement_menu()

def order_existing_product(store, product, supplier, quantity):
    pass


def order_new_product(store, product, supplier, quantity):
    pass


def place_order_from_supplier():
    store_id = input("What store are you ordering from (enter store id)?: ")
    product_id = input("What product do you want to order (enter product number)?: ")
    store = store_controller.get_store_by_id(store_id)
    product = product_controller.get_spare_part_by_id(product_id)
    supplier_ids = [supplier["new_company_id"] for supplier in product.suppliers]
    manufacturer_ids = [manufacturer["new_company_id"] for manufacturer in product.manufacturers]
    suppliers = company_controller.get_companies_by_ids(supplier_ids)
    manufacturers = company_controller.get_companies_by_ids(manufacturer_ids)
    for supplier in suppliers:
        for supplier_product in supplier.sells_product:
            if supplier_product.product_number == product_id:
                print(f"Supplier: {supplier.company_name}. {product.name} costs (euro){supplier_product['buy_price']} and takes "
                      f"{supplier_product['delivery_time']} days to deliver.")
    supplier = input(f"From what supplier do you want to order {product.name}?: ")
    quantity = int(input(f"How many {product.name} would you like to order?: "))
    new_product = True
    for store_product in store.products:
        if product_id == store_product.product_number:
            new_product = False
            order_existing_product(store, product, supplier, quantity)

    if new_product:
        order_new_product(store, product, supplier, quantity)

def main():
    negotiate_supplier_prices()


if __name__ == "__main__":
    main()

