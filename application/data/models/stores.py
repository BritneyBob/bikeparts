from sqlalchemy import Integer, Column, ForeignKey

from bikeparts.application.data.db import Base


class Stores(Base):
    __tablename__ = "stores"

    store_id = Column(Integer, primary_key=True, nullable=False, autoincrement=True)
    address_id = Column(Integer, ForeignKey('addresses.address_id'), nullable=False)
