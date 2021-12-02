from application.data.db import session
from application.data.models import SparePart, SparePartSupplier


def get_spare_parts():
    return session.query(SparePart).all()


def get_spare_part_by_id(_id):
    return session.query(SparePart).filter(SparePart.product_number == _id).first()


def get_spare_part_supplier_by_id(_id):
    # TODO Question: Can this one go here?
    return session.query(SparePartSupplier).filter(SparePartSupplier.product_number == _id).all()


def get_spare_parts_by_filter(_filter):
    # TODO How to filter on something that is not exact match? Can't get "like" to work
    return session.query(SparePart).filter(SparePart.name == _filter).all()
