from sqlalchemy import Integer, Column, ForeignKey, String

from bikeparts.application.data.db import Base


class SparePartsInStores(Base):
    __tablename__ = "spare_parts_in_stores"

    product_number = Column(Integer, ForeignKey('spare_parts.product_number'), primary_key=True, nullable=False)
    store_id = Column(Integer, ForeignKey('stores.store_id'), primary_key=True, nullable=False)
    shelf_number = Column(String(4), nullable=False)
    quantity_in_stock = Column(Integer, nullable=False)
    lowest_index = Column(Integer, nullable=False)
    quantity_to_order = Column(Integer, nullable=False)
