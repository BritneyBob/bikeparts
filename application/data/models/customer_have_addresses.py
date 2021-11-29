from sqlalchemy import Integer, Column, ForeignKey

from bikeparts.application.data.db import Base


class CustomerHaveAddresses(Base):
    __tablename__ = "customer_have_addresses"

    customer_id = Column(Integer, ForeignKey('customers.customer_id'), primary_key=True, nullable=False)
    address_id = Column(Integer, ForeignKey('addresses.address_id'), primary_key=True, nullable=False)
