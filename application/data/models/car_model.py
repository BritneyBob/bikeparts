from sqlalchemy import Integer, String, Column
from sqlalchemy.orm import relationship

from application.data.db import Base

#from application.data.models.customer_car import CustomerCar


class CarModel(Base):
    __tablename__ = "car_models"  # den här håller koll på vilken tabell vi matchar

    car_model_id = Column(Integer, primary_key=True, autoincrement=True)
    manufacturer = Column(String(45), nullable=False)
    model = Column(String(45), nullable=False)
    year = Column(String(4), nullable=False)
    customers = relationship("CustomerCar", back_populates="car_models")
    spare_parts = relationship("CarModelSparePart", back_populates="car_models")
