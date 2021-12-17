from application.controllersMDB import product_controller as prc, company_controller as cc, store_controller as stc, \
    product_controller
from application.controllersMDB.product_controller import adjust_price, get_products, get_products_by_filter


def search_products():
    name_filter = input("Which product are you looking for? Enter name/part of name. Leave blank to show all: ")
    products = prc.get_products()
    count = 0
    for product in products:
        if name_filter.lower() in str(product.name).lower():
            count += 1
            print(f"{count}.\t\tProduct name: {product.name}\t\t"
                  f"Description: {product.description}\t\tPrice to customer: {product.sell_price} EUR")
        else:
            continue


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
    product = product_controller.get_product_by_product_number(product_no)
    product_id = product._id
    # product_no = None
    print("*" * 50)
    print_product_info(product_no)
    print_supplier(product_id)
    print_manufacturer(product_id)
    print_stock_info(product_id)
    print("*" * 50)


def print_product_info(product_no):
    products = prc.get_products()
    for product in products:
        if product.product_number == int(product_no):
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
                print(f"\t{store.street_address}\t{store.zipcode}\t{store.city}\t{store.country}")
            else:
                continue
            # print((f"\t{store.store_id} {store.address.city_name}\t "
            #        f"Stock: {product_in_stock.quantity_in_stock}\tShelf number: {product_in_stock.shelf_number}"))


def update_a_product():
    search_products()
    product_no = input("\nEnter product number to update: ")
    spare_part = prc.get_product_by_id(product_no)
    print("*" * 50)
    print_product_info(product_no)
    print("*" * 50)

    # TODO Error handling of inputs that are too long for the database field
    new_name = input("\nEnter new name, or leave blank to keep the current name: ")
    new_description = input("\nEnter new description, or leave blank to keep the current description: ")
    if new_name == "" and new_description == "":
        print("No values were changed. Going back to product menu.")
    else:
        if new_name == "":
            new_name = spare_part.name
        else:
            new_name = new_name
        if new_description == "":
            new_description = spare_part.description
        else:
            # try:
            new_description = new_description
            # except (DataError, errors.DataError):
            #     print("You have entered a too long description, please try again!")
        prc.update_product(product_no, new_name, new_description)

        print("\nProduct info was updated. New information is:")
        print("*" * 50)
        print_product_info(product_no)
        print("*" * 50)


def add_product():
    print("Please enter product details for the new product!")
    name = input("Product name: ")
    description = input("Description: ")
    sell_price = input("Customer price: ")
    new_product = {
        "name": name,
        "description": description,
        "sell_price": sell_price
    }
    prc.create_product(new_product)
    adding_info = True
    added_product = prc.get_products_by_filter(name)
    for product in added_product:
        # TODO what if there is a double? Is there a way to get the recently added product no?
        while adding_info:
            print("Product details for the new product: ")
            print_product_info(product.product_number)
            print_supplier(product.product_number)
            print_manufacturer(product.product_number)
            print_stock_info(product.product_number)

            add_info = input("Do you want to add more product info? Y/N: ")
            if add_info.lower() == "n":
                adding_info = False
            else:
                choice = input("Which info do you want to add? S = suppliers, M = manufacturers, T = store: ")
                match choice.lower():
                    case "s":
                        add_supplier_to_product(product)
                    case "m":
                        add_manufacturer_to_product(product)
                    case "t":
                        add_stores_to_product(product)
                    case "_":
                        print("Please try again! The valid choices are S, M or T")


def add_supplier_to_product(product):
    adding_suppliers = True
    while adding_suppliers:
        print("Available suppliers: ")
        all_companies = cc.get_all_companies()
        for company in all_companies:
            if len(company.supplies_products) > 0:
                print(f"Id: {company.supplier_id} Company name: {company.company.company_name}")
            else:
                continue
        chosen_supplier_id = input("Enter a supplier id from the list: ")
        price = input("Enter the agreed buy price (EUR): ")
        delivery_time = input("Enter the number of days to deliver from this supplier: ")

        product_supplier = {
            "supplier_id": chosen_supplier_id,
            "new_company_id": cc.get_company_by_id()
        }
        prc.create_product_supplier(product_supplier, product)
        add_more = input("Do you want to add another supplier? Y/N: ")
        if add_more.lower() == "n":
            adding_suppliers = False


def add_manufacturer_to_product(product):
    adding_manufacturers = True
    while adding_manufacturers:
        print("Available manufacturers: ")
        all_manufacturers = cc.get_all_companies()
        for manufacturer in all_manufacturers:
            print(f"Id: {manufacturer.manufacturer_id} Company name: {manufacturer.company.company_name}")
        chosen_manufacturer_id = input("Enter a manufacturer id from the list: ")
        prc.create_product_manufacturer(product.product_number, chosen_manufacturer_id)
        add_more = input("Do you want to add another manufacturer? Y/N: ")
        if add_more.lower() == "n":
            adding_manufacturers = False


def add_stores_to_product(product):
    adding_stores = True
    while adding_stores:
        print("Available manufacturers: ")
        all_stores = stc.get_stores()
        for store in all_stores:
            print(f"Id: {store.store_id} City: {store.address.city_name}")
        chosen_store_id = input("Enter a store id from the list: ")
        shelf_number = input("Enter shelf number: ")
        quantity_in_stock = input("Enter actual quantity in stock: ")
        lowest_index = input("Enter stock value for autoorder: ")
        quantity_to_order = input("Enter order quantity for autoorder: ")
        spare_part_in_store = {
            "product_number": product.product_number,
            "store_id": chosen_store_id,
            "shelf_number": shelf_number,
            "quantity_in_stock": quantity_in_stock,
            "lowest_index": lowest_index,
            "quantity_to_order": quantity_to_order
        }
        prc.create_product_in_store(store, spare_part_in_store)
        add_more = input("Do you want to add the product to another store? Y/N: ")
        if add_more.lower() == "n":
            adding_stores = False


def adjust_sell_margins():
    all_products = get_products()
    name_filter = input("Which products sell margin do you want to adjust? Enter name/part of name: ")
    search_hits = []
    for product in all_products:
        if name_filter.lower() in product.name.lower():
            search_hits.append(product)

    count = 0
    for hit in search_hits:
        count += 1
        print(f"{count}.\t{hit.name}\t{hit.sell_price}")

    _id = None
    running = True
    while running:
        choice = int(input("\nEnter number for the product you want to adjust sell margins on: "))  # Check if user has chosed some other value
        if choice > len(search_hits) or choice < 1:
            print(f"Please choose a product number, 1 to {count}.\n")
        else:
            _id = search_hits[choice - 1]._id
            running = False

    print_product_info(_id)
    new_price = input("Enter new sell price, EUR: ")
    adjust_price(_id, new_price)
    print("Sell price has been updated.")


def main():
    show_one_product()


if __name__ == "__main__":
        main()
