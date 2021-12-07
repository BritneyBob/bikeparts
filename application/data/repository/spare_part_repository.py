from application.data.db import session
from application.data.models import SparePartSupplier, SparePart, SparePartInStore, \
    spare_parts_have_manufacturers_table, car_models_have_spare_parts_table


def create_spare_part(spare_part):
    spare_part = SparePart(**spare_part)
    session.add(spare_part)
    session.commit()


def create_spare_part_supplier(spare_part_supplier):
    spare_part_supplier = SparePartSupplier(**spare_part_supplier)
    session.add(spare_part_supplier)
    session.commit()


def create_spare_part_in_store(spare_part_in_store):
    spare_part_in_store = SparePartInStore(**spare_part_in_store)
    session.add(spare_part_in_store)
    session.commit()


def create_spare_part_manufacturer(spare_part, manufacturer):
    statement = spare_parts_have_manufacturers_table.insert().values(product_number=spare_part,
                                                                     manufacturer_id=manufacturer)
    session.execute(statement)
    session.commit()


def get_spare_parts():
    return session.query(SparePart).all()


def get_spare_part_by_id(_id):
    return session.query(SparePart).filter(SparePart.product_number == _id).first()


def get_spare_part_supplier_by_id(_id):
    return session.query(SparePartSupplier).filter(SparePartSupplier.product_number == _id).all()


def get_spare_parts_by_filter(_filter):
    return session.query(SparePart).filter(SparePart.name.like(f'%{_filter}%')).all()


def adjust_price(product_no, new_price):
    product = session.query(SparePart).filter(SparePart.product_number == product_no).first()
    product.sell_price = new_price
    print()
    session.commit()

#
# def get_spare_parts_without_car_model():
#     return session.query(SparePart).filter()

