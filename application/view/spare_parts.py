from application.controllers import spare_part_controller
from application.controllers.spare_part_controller import adjust_price
from application.controllers.store_controller import view_stores, get_spare_part_in_store_by_store_id_and_product_number


def search_spare_parts():
    name_filter = input("Which product are you looking for? Enter name/part of name. Leave blank to show all: ")
    search_hits = spare_part_controller.get_spare_parts_by_filter(name_filter)
    for spare_part in search_hits:
        print(f"Product number: {spare_part.product_number}\t\tProduct name: {spare_part.name}\t\t"
              f"Description: {spare_part.description}\t\tPrice to customer: {spare_part.sell_price} EUR")


def show_all_spare_parts():
    print("List of available spare parts: ")
    spare_parts = spare_part_controller.get_spare_parts()
    for spare_part in spare_parts:
        print(f"Product number: {spare_part.product_number}\t\tName: {spare_part.name}"
              f"\t\tDescription: {spare_part.description}\t\tPrice: {spare_part.sell_price} EUR")


def show_one_spare_part():
    product_no = input("Enter product number to show one product: ")  # TODO Error handling of input!
    print_spare_part(product_no)


def print_spare_part(product_no):
    spare_part = spare_part_controller.get_spare_part_by_id(product_no)
    suppliers = spare_part_controller.get_spare_part_suppliers(product_no)
    manufacturer_id_s = [manufacturer.manufacturer_id for manufacturer in spare_part.manufacturers]
    sorted_stores = sorted(view_stores(), key=lambda x: x.store_id)

    print("*" * 50)
    print(f"Product number and name: {spare_part.product_number} {spare_part.name}")
    print(f"Description: {spare_part.description}")
    print(f"Customer price: {spare_part.sell_price} EUR")
    print(f"Available from the following suppliers: ")
    for supplier in suppliers:
        supplier_company = spare_part_controller.get_spare_part_supplier_company(supplier.supplier_id)
        for company in supplier_company:
            print(f"\tCompany name: {company.company_name}\tBuy price: {supplier.buy_price} EUR")
    print(f"Manufactured by: ")
    for manufacturer_id in manufacturer_id_s:
        manufacturer_company = spare_part_controller.get_spare_part_manufacturer_company(manufacturer_id)
        for company in manufacturer_company:
            print(f"\tCompany name: {company.company_name}")
    print(f"Items in stock in the following stores: ")
    for store in sorted_stores:
        stock_info = get_spare_part_in_store_by_store_id_and_product_number(store.store_id, spare_part.product_number)
        try:
            print(f"\t{store.store_id} {store.address.city_name}\t "
                  f"Stock: {stock_info.quantity_in_stock}\tShelf number: {stock_info.shelf_number}")
        except:
            continue


def adjust_sell_margins():
    name_filter = input("Which products sell margin do you want to adjust? Enter name/part of name: ")
    search_hits = spare_part_controller.get_spare_parts_by_filter(name_filter)
    for hit in search_hits:
        print(hit)
    product_no = input('\nEnter Product number for the product you want to adjust sell margins on: ')
    print_spare_part(product_no)
    new_price = input('Enter new sell price, EUR: ')
    adjust_price(product_no, new_price)
    print('Sell price has been updated.')
