from sqlalchemy import Integer, Column, ForeignKey
from sqlalchemy.orm import relationship

from application.data.db import Base


class CustomerAddress(Base):
    __tablename__ = "customers_have_addresses"

    customer_id = Column(Integer, ForeignKey('customers.customer_id'), primary_key=True, nullable=False)
    address_id = Column(Integer, ForeignKey('addresses.address_id'), primary_key=True, nullable=False)
    customer = relationship("Customer", back_populates="addresses")
    address = relationship("Address", back_populates="customers")
