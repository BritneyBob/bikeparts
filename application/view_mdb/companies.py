import datetime

from bson import ObjectId

from application.controllersMDB import company_controller, store_controller, product_controller
from application.controllersMDB.product_controller import get_products

from application.view_mdb import options


def negotiate_supplier_prices():
    print("List of our suppliers:")
    suppliers = company_controller.get_suppliers()
    count = 0
    supplier_list = []
    for supplier in suppliers:
        count += 1
        print(f"{count}. {supplier.company_name}")
        supplier_list.append(supplier.company_name)

    supplier_name = None
    running = True
    while running:
        choice = int(input("Enter the number for the supplier you want to negotiate with: "))
        if choice > len(suppliers) or choice < 1:
            print(f"Please choose a supplier number, 1 to {count}.\n")
        else:
            supplier_name = supplier_list[choice - 1]
            running = False

    prod_name_price = []
    all_products = get_products()
    print(f"\nThese are the products that the supplier {supplier_name} sells to you: ")
    for supplier in suppliers:
        if supplier.company_name == supplier_name:
            for product in supplier.supplies_products:
                for p in all_products:
                    if p._id == ObjectId(product["product_number"]):
                        print(f"Product name: {p.name}\tCurrent buy price: {product['buy_price']}")
                        prod_name_price.append({"name": p.name, "buy_price": product['buy_price']})

    new_buy_prices = company_controller.negotiation(prod_name_price, supplier_name)
    print()
    print("*" * 60)
    print("Product list with updated prices:")
    for i in range(len(prod_name_price)):
        print(f"Product name: {prod_name_price[i]['name']}\t New buy price: {new_buy_prices[i]}")


def print_company_info(company):
    print(f"\nCompany name: {company.company_name}")
    print(f"Company id: {company._id}")
    print(f"\nCompany contact mail: {company.contact['email']}")
    print(f"Company contact phone number: {company.contact['phone_number']}\n")
    for address in company.addresses:
        print(f"{address['address_type']}: {address['street_address']}\t {address['zipcode']} "
              f"{address['city']}\t {address['country']}")


def view_companies():
    companies = company_controller.get_all_companies()
    print("All companies: ")
    for company in companies:
        print(f"Company id: {company._id}, Company name: {company.company_name}, Company type: {company.company_type}")

    valid_company = False
    while not valid_company:
        company_name = input("Please enter the name of the company you want to see more information about: ")
        for company in companies:
            if company.company_name.lower() == company_name.lower():
                print_company_info(company)
                valid_company = True
        if not valid_company:
            print(f"There is no company named {company_name}. Please try again.")


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
    company_controller.update_company_address(company, address)


def print_new_info(company_id):
    print("The company was updated with the new information: ")
    updated_company = company_controller.get_company_by_id(company_id)
    print_company_info(updated_company)


def update_company():
    companies = company_controller.get_all_companies()
    valid_company = False
    chosen_company = None
    while not valid_company:
        company_name = input("Please enter the name of the company you would like to update information for: ")
        for company in companies:
            if company.company_name.lower() == company_name.lower():
                print_company_info(company)
                chosen_company = company
                valid_company = True
        if not valid_company:
            print(f"There is no company named {company_name}. Please try again.")

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
        if choice in "1234569" and len(choice) == 1:
            break
        print("Valid options are 1, 2, 3, 4, 5, 6 or 9")

    match choice:
        case "1":
            new_company_name = input("Please enter new name: ")
            company_controller.update_company_name(chosen_company, new_company_name)
            print_new_info(chosen_company._id)
        case "2":
            insert_new_address_info("Visiting address", chosen_company)
            print_new_info(chosen_company._id)
        case "3":
            insert_new_address_info("Delivery address", chosen_company)
            print_new_info(chosen_company._id)
        case "4":
            insert_new_address_info("Billing address", chosen_company)
            print_new_info(chosen_company._id)
        case "5":
            new_contact_first_name = input("Please enter new first name: ")
            new_contact_last_name = input("Please enter new last name: ")
            company_controller.update_contact_name(chosen_company, new_contact_first_name, new_contact_last_name)
            print_new_info(chosen_company._id)
        case "6":
            new_phone_number = input("Please enter new phone number: ")
            company_controller.update_contact_phone_number(chosen_company, new_phone_number)
            print_new_info(chosen_company._id)
        case "9":
            options.procurement_menu()


def create_order_dict(store, product, supplier, quantity, manufacturers, price, delivery_days):
    today = datetime.datetime.now()
    supplier_order = {
        "store": {
            "store_number": store.store_number,
            "city": store.city,
            "country": store.country
        },
        "product": {
                "product_id": product._id,
                "name": product.name
            },
        "order_date": today,
        "ordered_quantity": quantity,
        "price_each": price,
        "arrival_date": today + datetime.timedelta(days=delivery_days),
        "supplier": {
            "company_id": supplier._id,
            "name": supplier.company_name
            }
    }

    product_manufacturers = []
    try:
        for manufacturer in manufacturers:
            product_manufacturers.append({
                "company_id": manufacturer._id,
                "name": manufacturer.company_name
            })
            supplier_order["manufacturers"] = product_manufacturers
    except AttributeError:
        pass

    return supplier_order


def place_order_from_supplier():
    store_number = int(input("What store are you ordering from (enter store number)?: "))
    product_number = int(input("What product would you like to order (enter product number)?: "))
    store = store_controller.get_store_by_number(store_number)
    product = product_controller.get_product_by_product_number(product_number)
    supplier_ids = [supplier["company_id"] for supplier in product.suppliers]
    manufacturer_ids = [manufacturer["company_id"] for manufacturer in product.manufacturers]
    suppliers = company_controller.get_companies_by_ids(supplier_ids)
    manufacturers = company_controller.get_companies_by_ids(manufacturer_ids)
    count = 1
    supplier_product_info = []
    for supplier in suppliers:
        for supplier_product in supplier.supplies_products:
            product_object = product_controller.get_product_by_id(supplier_product["product_number"])
            if product_object.product_number == product_number:
                print(f"{count}. Supplier: {supplier.company_name}.\t{product.name} costs ???"
                      f"{supplier_product['buy_price']} and takes {supplier_product['delivery_time']} days to deliver.")
                supplier_product_info.append((supplier._id, supplier_product["buy_price"],
                                              supplier_product["delivery_time"]))
                count += 1
    supplier_choice = int(input(f"From what supplier would you like to order {product.name} "
                                f"(1-{count-1})?: "))

    supplier_id, price, delivery_days = supplier_product_info[supplier_choice - 1]
    chosen_supplier = company_controller.get_company_by_id(supplier_id)

    chosen_quantity = int(input(f"How many {product.name} would you like to order?: "))
    new_product = True
    supplier_order = create_order_dict(store, product, chosen_supplier, chosen_quantity, manufacturers, price,
                                       delivery_days)
    for store_product in store.products:
        product_object2 = product_controller.get_product_by_id(store_product["product_id"])
        if product_object2.product_number == product_number:
            new_product = False

    if new_product:
        store_controller.add_product_to_store(store, product)

    company_controller.create_order(supplier_order)
    store_controller.update_stock_in_store(store.store_number, product._id, chosen_quantity)
