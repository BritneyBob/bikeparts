from sqlalchemy import Integer, Column, String
from sqlalchemy.orm import relationship

from application.data.db import Base


class AddressType(Base):
    __tablename__ = "address_types"

    address_type_id = Column(Integer, primary_key=True, nullable=False, autoincrement=True)
    address_type_name = Column(String(45))
    addresses = relationship("Address")
