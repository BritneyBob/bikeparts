from sqlalchemy import Integer, Column, ForeignKey

from application.data.db import Base


class SparePartManufacturer(Base):
    __tablename__ = "spare_parts_have_manufacturers"

    product_number = Column(Integer, ForeignKey('spare_parts.product_number'), primary_key=True, nullable=False)
    manufacturer_id = Column(Integer, ForeignKey('manufacturers.manufacturer_id'), primary_key=True, nullable=False)
