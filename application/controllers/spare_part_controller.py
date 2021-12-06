from application.data.repository import spare_part_repository as spr


def create_spare_part(spare_part):
    spr.create_spare_part(spare_part)


def create_spare_part_supplier(spare_part_supplier):
    spr.create_spare_part_supplier(spare_part_supplier)


def create_spare_part_in_store(spare_part_in_store):
    spr.create_spare_part_in_store(spare_part_in_store)


def create_spare_part_manufacturer(spare_part, manufacturer):
    spr.create_spare_part_manufacturer(spare_part, manufacturer)


def get_spare_parts():
    return spr.get_spare_parts()


def get_spare_part_by_id(_id):
    return spr.get_spare_part_by_id(_id)


def get_spare_part_supplier_by_id(_id):
    return spr.get_spare_part_supplier_by_id(_id)


def get_spare_parts_by_filter(_filter):
    return spr.get_spare_parts_by_filter(_filter)


def adjust_price(product_no, new_price):
    return spr.adjust_price(product_no, new_price)


