from sqlalchemy import Integer, String, Column, ForeignKey
from sqlalchemy.orm import relationship

from application.data.db import Base

from application.data.models.customer import Customer
#from application.data.models.car_model import CarModel


class CustomerCar(Base):
    __tablename__ = "customer_cars"

    license_number = Column(String(6), primary_key=True, autoincrement=True)
    customer_id = Column(Integer, ForeignKey("customers.customer_id"))
    car_model_id = Column(Integer, ForeignKey("car_models.car_model_id"))
    color = Column(String(20), nullable=False)
    customers = relationship("Customer", back_populates="car_models")
    car_models = relationship("CarModel", back_populates="customers")
