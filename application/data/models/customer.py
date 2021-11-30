from sqlalchemy import Integer, String, Column, Boolean
from sqlalchemy.orm import relationship

from application.data.db import Base


class Customer(Base):
    __tablename__ = "customers"

    customer_id = Column(Integer, primary_key=True, autoincrement=True)
    customer_name = Column(String(100), nullable=True)
    contact_first_name = Column(String(60), nullable=False)
    contact_last_name = Column(String(60), nullable=False)
    phonenumber = Column(String(20), nullable=False)
    is_company = Column(Boolean, nullable=False)
    car_models = relationship("CustomerCar", back_populates="customers")
    customer_orders = relationship("CustomerOrder")
