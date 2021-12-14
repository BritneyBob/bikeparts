from application.data.dataMDB.repositoryMDB import product_repository as pr


def create_spare_part(spare_part):
    pr.create_spare_part(spare_part)


def create_spare_part_supplier(spare_part_supplier):
    pr.create_spare_part_supplier(spare_part_supplier)


def create_spare_part_in_store(spare_part_in_store):
    pr.create_spare_part_in_store(spare_part_in_store)


def create_spare_part_manufacturer(spare_part, manufacturer):
    pr.create_spare_part_manufacturer(spare_part, manufacturer)


def get_spare_parts():
    return pr.get_spare_parts()


def get_spare_part_by_id(product_no):
    return pr.get_spare_part_by_id(product_no)


def get_spare_parts_by_filter(name_filter):
    return pr.get_spare_parts_by_filter(name_filter)


def get_spare_part_suppliers(product_no):
    return pr.get_spare_part_suppliers(product_no)


def get_spare_part_supplier_company(supplier_id):
    return pr.get_spare_part_supplier_company(supplier_id)


def get_spare_part_manufacturer_company(manufacturer_id):
    return pr.get_spare_part_manufacturer_company(manufacturer_id)


def update_product(product_no, new_name, new_description):
    return pr.update_product(product_no, new_name, new_description)


def adjust_price(product_no, new_price):
    return pr.adjust_price(product_no, new_price)
