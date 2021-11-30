from sqlalchemy import Integer, Column, ForeignKey
from sqlalchemy.orm import relationship

from application.data.db import Base


class Store(Base):
    __tablename__ = "stores"

    store_id = Column(Integer, primary_key=True, nullable=False, autoincrement=True)
    address_id = Column(Integer, ForeignKey('addresses.address_id'), nullable=False)
    employees = relationship("Employee")
