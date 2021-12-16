from application.dataMDB.modelsMDB import Product


def create_product(product):
    Product(product).save()


def create_product_supplier(company, product):
    company.supplies_products.append(product)
    company.save()


def create_product_in_store(store, product):
    store.products.append(product)
    store.save()


def create_product_manufacturer(company, product):
    company.manufactures_products.append(product)
    company.save()


def get_products():
    return Product.all()


def get_products_by_filter(name_filter):
    return Product.find(name=name_filter).first_or_none()


def get_product_by_id(product_id):
    return Product.find(_id=product_id).first_or_none()


def update_product(product, new_name, new_description):
    product.name = new_name
    product.description = new_description
    product.save()


def adjust_price(_id, new_price):
    product = Product.find(_id=_id).first_or_none()
    product.sell_price = new_price
    product.save()
    # product = session.query(SparePart).filter(SparePart.product_number == product_no).first()
    # product.sell_price = new_price
    # print()
    # session.commit()
#
#
# # returns a bunch of supplier companies based on the selected product
# def get_product_suppliers(product_no):
#     pass
#
# # returns company related to supplier_id
# def get_spare_part_supplier_company(supplier_id):
#     return session.query(Company).join(Supplier).filter(Supplier.supplier_id == supplier_id).all()
#
#
# # returns company related to manufacturer_id
# def get_spare_part_manufacturer_company(manufacturer_id):
#     return session.query(Company).join(Manufacturer).filter(Manufacturer.manufacturer_id == manufacturer_id).all()
#
