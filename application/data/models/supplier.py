from sqlalchemy import Integer, Column, ForeignKey
from sqlalchemy.orm import relationship

from application.data.db import Base

from application.data.models.company import Company
from application.data.models.spare_part_supplier import SparePartSupplier


class Supplier(Base):
    __tablename__ = "suppliers"

    supplier_id = Column(Integer, primary_key=True, autoincrement=True)
    company_id = Column(Integer, ForeignKey("companies.company_id"))
    company = relationship("Company", back_populates="supplier")
    spare_parts = relationship("SparePartSupplier", back_populates="supplier")
    # TODO: Add relation to auto_orders
