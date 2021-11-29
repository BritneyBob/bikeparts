from sqlalchemy import Integer, Column, String

from bikeparts.application.data.db import Base


class AutoOrders(Base):
    __tablename__ = "auto_orders"

    address_type_id = Column(Integer, primary_key=True, nullable=False, autoincrement=True)
    address_type_name = Column(String(45))
