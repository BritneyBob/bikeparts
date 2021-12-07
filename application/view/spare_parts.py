from application.controllers import spare_part_controller


def search_spare_parts():
    name_filter = input("Which product are you looking for? Enter name/part of name. Leave blank to show all: ")
    search_hits = spare_part_controller.get_spare_parts_by_filter(name_filter)
    for spare_part in search_hits:
        print(f"Product number: {spare_part.product_number}\t\tProduct name: {spare_part.name}\t\t"
              f"Description: {spare_part.description}\t\tPrice to customer: {spare_part.sell_price} EUR")


def show_one_spare_part():
    product_no = input("Enter product number to show one product: ")  # TODO Error handling of input!
    spare_part = spare_part_controller.get_spare_part_by_id(product_no)
    suppliers = spare_part_controller.get_spare_part_suppliers(product_no)
    stores =
    # manufacturers = spare_part_controller.get_spare_part_manufacturers(product_no)
    print("*" * 50)
    print(f"Product number and name: {spare_part.product_number} {spare_part.name}")
    print(f"Description: {spare_part.description}")
    print(f"Customer price: {spare_part.sell_price} EUR")
    print(f"Available from the following suppliers: ")
    for supplier in suppliers:
        supplier_company = spare_part_controller.get_spare_part_supplier_company(supplier.supplier_id)
        print(f"Company name: {supplier_company}\tBuy price: {supplier.buy_price} EUR")
        # TODO Find out why I can't print company name. supplier_company.company_name => error
    # print(f"Manufactured by: ")
    # for manufacturer in manufacturers:
    #     manufacturer_company = spare_part_controller.get_spare_part_manufacturer_company(manufacturer.manufacturer_id)
    #     print(f"Company name: {manufacturer_company}")
    print(f"Items in stock: ")

    # Add store + stock
