from application.controllersMDB import product_controller as prc, company_controller as cc, store_controller as stc


def search_products():
    name_filter = input("Which product are you looking for? Enter name/part of name. Leave blank to show all: ")
    search_hits = []
    products = prc.get_products()
    count = 0
    for product in products:
        if name_filter.lower() in str(product.name).lower():
            count += 1
            print(f"{count}.\t\tProduct name: {product.name}\t\t"
                  f"Description: {product.description}\t\tPrice to customer: {product.sell_price} EUR")
            search_hits.append(product)
        else:
            continue
    return search_hits


def show_all_products():
    print("List of available spare parts: ")
    products = prc.get_products()
    count = 0
    for product in products:
        count += 1
        print(f"{count}.\t\tProduct number: {product.product_number}\t\tName: {product.name}"
              f"\t\tDescription: {product.description}\t\tPrice: {product.sell_price} EUR")


def show_one_product():
    product_no = int(input("Enter product number to show one product: "))  # TODO Error handling of input!
    product = prc.get_product_by_product_number(product_no)
    product_id = product._id
    print("*" * 50)
    print_product_info(product_id)
    print_supplier(product_id)
    print_manufacturer(product_id)
    print_stock_info(product_id)
    print("*" * 50)


def print_product_info(product_id):
    products = prc.get_products()
    for product in products:
        if product._id == product_id:
            print(f"Product number and name: {product.product_number} {product.name}")
            print(f"Description: {product.description}")
            print(f"Customer price: {product.sell_price} EUR")
        else:
            continue


def print_supplier(product_no):
    suppliers = cc.get_suppliers()
    print(f"Available from the following suppliers: ")
    for supplier in suppliers:
        products = [product for product in supplier.supplies_products]
        for product in products:
            if product["product_number"] == product_no:
                print(f"\tCompany name: {supplier.company_name}\tBuy price: {product['buy_price']} EUR")
            else:
                continue


def print_manufacturer(product_no):
    manufacturers = cc.get_manufacturers()
    print(f"Manufactured by: ")
    for manufacturer in manufacturers:
        products = [product for product in manufacturer.manufactures_products]
        for product in products:
            if product["product_number"] == product_no:
                print(f"\tCompany name: {manufacturer.company_name}")
            else:
                continue


def print_stock_info(product_no):
    stores = stc.get_stores()
    print(f"Items in stock in the following stores: ")
    for store in stores:
        products = [product for product in store.products]
        for product in products:
            if product["product_id"] == product_no:
                print(f"\t{store.store_number}\t{store.city}\t"
                      f"Stock: {product['quantity_in_stock']}\tShelf number: {product['shelf_number']}")
            else:
                continue


def update_a_product():
    search_hits = search_products()
    product_id = None
    running = True
    while running:
        choice = int(input("\nEnter number for the product you want to update: "))  # Check if user has chosen some other value
        if choice > len(search_hits) or choice < 1:
            print(f"Please choose a product number, 1 to {len(search_hits)}.\n")
        else:
            product_id = search_hits[choice - 1]._id
            running = False
    product = prc.get_product_by_id(product_id)
    print("*" * 50)
    print_product_info(product_id)
    print("*" * 50)

    new_name = input("\nEnter new name, or leave blank to keep the current name: ")
    new_description = input("\nEnter new description, or leave blank to keep the current description: ")
    if new_name == "" and new_description == "":
        print("No values were changed. Going back to product menu.")
    else:
        if new_name == "":
            new_name = product.name
        else:
            new_name = new_name
        if new_description == "":
            new_description = product.description
        else:
            new_description = new_description
        prc.update_product(product, new_name, new_description)

        print("\nProduct info was updated. New information is:")
        print("*" * 50)
        print_product_info(product_id)
        print("*" * 50)


def add_product():
    print("Please enter product details for the new product!")
    name = input("Product name: ")
    description = input("Description: ")
    sell_price = float(input("Customer price: "))
    product_number = len(prc.get_products()) + 1
    available_in_stores = []
    suppliers = []
    manufacturers = []
    new_product = {
        "product_number": product_number,
        "sell_price": sell_price,
        "name": name,
        "description": description,
        "available_in_stores": available_in_stores,
        "suppliers": suppliers,
        "manufacturers": manufacturers
    }
    prc.create_product(new_product)
    adding_info = True
    product_number = len(prc.get_products())
    added_product = prc.get_product_by_product_number(product_number)
    while adding_info:
        print("Product details for the new product: ")
        print_product_info(added_product._id)
        print_supplier(added_product._id)
        print_manufacturer(added_product._id)
        print_stock_info(added_product._id)

        add_info = input("Do you want to add more product info? Y/N: ")
        if add_info.lower() == "n":
            adding_info = False
        else:
            choice = input("Which info do you want to add? S = suppliers, M = manufacturers, T = store: ")
            match choice.lower():
                case "s":
                    add_supplier_to_product(added_product)
                case "m":
                    add_manufacturer_to_product(added_product)
                case "t":
                    add_stores_to_product(added_product)
                case "_":
                    print("Please try again! The valid choices are S, M or T")


def add_supplier_to_product(product):
    adding_suppliers = True
    while adding_suppliers:
        print("Available suppliers: ")
        supplier_companies = cc.get_suppliers()
        for company in supplier_companies:
            if len(company.supplies_products) > 0:
                print(f"Id: {company.company_id} Company name: {company.company_name}")
            else:
                continue
        chosen_supplier_id = int(input("Enter a supplier id from the list: "))
        company = cc.get_company_by_old_id(chosen_supplier_id)
        buy_price = float(input("Enter the agreed buy price (EUR): "))
        delivery_time = int(input("Enter the number of days to deliver from this supplier: "))
        supplied_product = {
            "product_number": product._id,
            "buy_price": buy_price,
            "delivery_time": delivery_time
        }
        prc.create_product_supplier(company, supplied_product)

        add_more = input("Do you want to add another supplier? Y/N: ")
        if add_more.lower() == "n":
            adding_suppliers = False


def add_manufacturer_to_product(product):
    adding_manufacturers = True
    while adding_manufacturers:
        print("Available manufacturers: ")
        manufacturer_companies = cc.get_manufacturers()
        for company in manufacturer_companies:
            print(f"Id: {company.company_id} Company name: {company.company_name}")
        chosen_manufacturer_id = int(input("Enter a manufacturer id from the list: "))
        company = cc.get_company_by_old_id(chosen_manufacturer_id)
        prc.create_product_manufacturer(company, product)
        add_more = input("Do you want to add another manufacturer? Y/N: ")
        if add_more.lower() == "n":
            adding_manufacturers = False


def add_stores_to_product(product):
    adding_stores = True
    while adding_stores:
        print("Available stores: ")
        all_stores = stc.get_stores()
        for store in all_stores:
            print(f"Id: {store.store_number} City: {store.city}")
        chosen_store_id = int(input("Enter a store id from the list: "))
        store = stc.get_store_by_number(chosen_store_id)
        shelf_number = input("Enter shelf number: ")
        quantity_in_stock = input("Enter actual quantity in stock: ")
        product_in_store = {
            "shelf_number": shelf_number,
            "quantity_in_stock": quantity_in_stock,
            "product_id": product._id,
        }
        prc.create_product_in_store(store, product_in_store)
        add_more = input("Do you want to add the product to another store? Y/N: ")
        if add_more.lower() == "n":
            adding_stores = False


def adjust_sell_margins():
    all_products = prc.get_products()
    name_filter = input("Which products sell margin do you want to adjust? Enter name/part of name: ")
    search_hits = []
    for product in all_products:
        if name_filter.lower() in product.name.lower():
            search_hits.append(product)

    count = 0
    for hit in search_hits:
        count += 1
        print(f"{count}.\t{hit.name}\t{hit.sell_price}")

    product_id = None
    running = True
    while running:
        choice = int(input("\nEnter number for the product you want to adjust sell margins on: "))  # Check if user has chosen some other value
        if choice > len(search_hits) or choice < 1:
            print(f"Please choose a product number, 1 to {count}.\n")
        else:
            product_id = search_hits[choice - 1]._id
            running = False

    print_product_info(product_id)
    new_price = input("Enter new sell price, EUR: ")
    prc.adjust_price(product_id, new_price)
    print("Sell price has been updated.")
