from application.data.db import session
from application.data.models import SparePartSupplier, SparePart


def create_spare_part(spare_part):
    spare_part = SparePart(**spare_part)
    session.add(spare_part)
    session.commit()


def create_spare_part_supplier(spare_part_supplier):
    spare_part_supplier = SparePartSupplier(**spare_part_supplier)
    session.add(spare_part_supplier)
    session.commit()
