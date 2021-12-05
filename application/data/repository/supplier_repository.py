from application.data.db import session
from application.data.models import Supplier, SparePart, Company, SparePartSupplier


def create_supplier(supplier):
    supplier = Supplier(**supplier)
    session.add(supplier)
    session.commit()


def get_suppliers():
    suppliers = session.query(Supplier).all()
    return suppliers


def show_products_from_company(_id):
    products = session.query(
        SparePart,
        SparePartSupplier
    ).join(
        SparePartSupplier
    ).join(
        Supplier
    ).join(
        Company
    ).filter(
        Supplier.supplier_id == _id
    ).all(
    )
    print()
    name_and_buy_price = []
    # for product in products:
    #     name_and_buy_price.append({'Product number: ': {product[0]}, 'Product name: ': {product['name']},
    #                         'Buy price: ': {product['buy_price']}})
    return name_and_buy_price




