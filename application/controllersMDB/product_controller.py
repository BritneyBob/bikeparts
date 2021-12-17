from application.dataMDB.repositoryMDB import product_repository as pr


def create_product(product):
    pr.create_product(product)


def create_product_supplier(company, product):
    pr.create_product_supplier(company, product)


def create_product_in_store(store, product):
    pr.create_product_in_store(store, product)


def create_product_manufacturer(company, product):
    pr.create_product_manufacturer(company, product)


def get_products():
    return pr.get_products()


def get_product_by_id(product_id):
    return pr.get_product_by_id(product_id)


def get_product_by_product_number(product_number):
    return pr.get_product_by_product_number(product_number)


def get_products_by_filter(name_filter):
    return pr.get_products_by_filter(name_filter)


def update_product(product, new_name, new_description):
    return pr.update_product(product, new_name, new_description)


def adjust_price(product_id, new_price):
    return pr.adjust_price(product_id, new_price)


def print_spare_part_info(_id):
    return
