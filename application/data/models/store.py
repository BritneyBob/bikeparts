from sqlalchemy import Integer, Column, ForeignKey
from sqlalchemy.orm import relationship

from application.data.db import Base

from application.data.models.employee import Employee
from application.data.models.spare_part_in_store import SparePartInStore


class Store(Base):
    __tablename__ = "stores"

    store_id = Column(Integer, primary_key=True, nullable=False, autoincrement=True)
    address_id = Column(Integer, ForeignKey('addresses.address_id'), nullable=False)
    employees = relationship("Employee")
    addresses = relationship("Address", back_populates="stores")
    spare_parts = relationship("SparePartInStore", back_populates="stores")
    # TODO: Add relation to customer_orders
