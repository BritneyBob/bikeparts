import decimal
import random

from application.data.db import session
from application.data.models import Supplier, SparePart, Company, SparePartSupplier


def create_supplier(supplier):
    supplier = Supplier(**supplier)
    session.add(supplier)
    session.commit()


def get_suppliers():
    suppliers = session.query(Supplier).all()
    return suppliers


def negotiation(id_and_buy_price, company_id):
    id_and_buy_price = id_and_buy_price
    price_changes = [0.8, 0.9, 1.1, 1.2]
    # price_changes is float values but buy_price decimal values so price_changes has to be converted before operation
    new_change = round(decimal.Decimal(random.choice(price_changes)), 1)

    new_id_and_buy_prices = [i['buy_price: '] * new_change for i in id_and_buy_price]
        # decimal.Decimal(self.amount)
    print()
    return

"""
for interchange in data:
    ltype='asdf'
    plink='qwer'

    e = Part.query.filter_by(interchange=interchange, light_type=ltype).first()
    if e is None:
        notpresent = notpresent + 1
        p = Part(interchange=interchange,light_type=ltype,partslink=plink,ptype=ptype)
        db.session.add(p)
    else:
        present = present + 1
        e.partslink = plink
        e.ptype = ptype
        db.session.add(e)  # here 'add' is adding changes to the session, not a new item.

db.session.commit()
"""

# def show_products_from_company(_id):
#     products = session.query(
#         SparePart,
#         SparePartSupplier
#     ).join(
#         SparePartSupplier
#     ).join(
#         Supplier
#     ).join(
#         Company
#     ).filter(
#         Supplier.supplier_id == _id
#     ).all(
#     )
#     print()
#     name_and_buy_price = []
#     # for product in products:
#     #     name_and_buy_price.append({'Product number: ': {product[0]}, 'Product name: ': {product['name']},
#     #                         'Buy price: ': {product['buy_price']}})
#     return name_and_buy_price




