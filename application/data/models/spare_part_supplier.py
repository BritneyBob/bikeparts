from sqlalchemy import Integer, Column, Numeric, ForeignKey
from sqlalchemy.orm import relationship

from application.data.db import Base


class SparePartSupplier(Base):
    __tablename__ = "spare_parts_have_suppliers"

    product_number = Column(Integer, ForeignKey('spare_parts.product_number'), primary_key=True, nullable=False)
    supplier_id = Column(Integer, ForeignKey('suppliers.supplier_id'), primary_key=True, nullable=False)
    buy_price = Column(Numeric, nullable=False)
    delivery_time = Column(Integer, nullable=False)
    spare_parts = relationship("SparePart", back_populates="suppliers")
    suppliers = relationship("Supplier", back_populates="spare_parts")
