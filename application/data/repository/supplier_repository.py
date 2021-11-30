from application.data.db import session
from application.data.models.supplier import Supplier


def create_supplier(supplier):
    supplier = Supplier(**supplier)
    session.add(supplier)
    session.commit()
