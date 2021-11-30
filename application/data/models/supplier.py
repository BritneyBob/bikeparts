from sqlalchemy import Integer, Column, ForeignKey
from sqlalchemy.orm import relationship

from application.data.db import Base

from application.data.models.company import Company
from application.data.models.spare_part_supplier import SparePartSupplier


class Supplier(Base):
    __tablename__ = "suppliers"

    supplier_id = Column(Integer, primary_key=True, autoincrement=True)
    company_id = Column(Integer, ForeignKey("companies.company_id"))
    companies = relationship("Company", back_populates="suppliers")
    spare_parts = relationship("SparePartSupplier", back_populates="suppliers")
    # TODO: Add relation to auto_orders
