from application.dataMDB.modelsMDB import Product


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
    return Product.all()


def get_spare_parts_by_filter(name_filter):
    return session.query(SparePart).filter(SparePart.name.like(f'%{name_filter}%')).all()


def get_spare_part_by_id(product_id):
    return Product.find(_id=product_id).first_or_none()


def get_spare_part_by_product_number(product_number):
    return Product.find(product_number=product_number).first_or_none()


# returns a bunch of supplier id's based on the selected product
def get_spare_part_suppliers(product_no):
    return session.query(SparePartSupplier).filter(SparePartSupplier.product_number == product_no).all()


# returns company related to supplier_id
def get_spare_part_supplier_company(supplier_id):
    return session.query(Company).join(Supplier).filter(Supplier.supplier_id == supplier_id).all()


# returns company related to manufacturer_id
def get_spare_part_manufacturer_company(manufacturer_id):
    return session.query(Company).join(Manufacturer).filter(Manufacturer.manufacturer_id == manufacturer_id).all()


def update_product(product_no, new_name, new_description):
    product = get_spare_part_by_id(product_no)
    product.name = new_name
    product.description = new_description
    session.add(product)
    session.commit()


def adjust_price(product_no, new_price):
    product = session.query(SparePart).filter(SparePart.product_number == product_no).first()
    product.sell_price = new_price
    print()
    session.commit()
