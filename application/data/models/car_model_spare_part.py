from sqlalchemy import Integer, Column, ForeignKey
from sqlalchemy.orm import relationship

from application.data.db import Base


# Should this rather be an association table, and not a class?
class CarModelSparePart(Base):
    __tablename__ = "car_models_have_spare_parts"

    car_model_id = Column(Integer, ForeignKey('car_models.car_model_id'), primary_key=True, nullable=False)
    product_number = Column(Integer, ForeignKey('spare_parts.product_number'), primary_key=True, nullable=False)
    car_models = relationship("CarModel", back_populates="spare_parts")
    spare_parts = relationship("SparePart", back_populates="car_models")
